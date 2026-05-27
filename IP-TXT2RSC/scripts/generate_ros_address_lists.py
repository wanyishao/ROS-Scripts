#!/usr/bin/env python3
import ipaddress
import datetime
import urllib.request
from pathlib import Path


SOURCES = {
    "CN_IP": {
        "family": "ipv4",
        "url": "https://metowolf.github.io/iplist/data/country/CN.txt",
    },
    "内蒙古IPV4段": {
        "family": "ipv4",
        "url": "https://metowolf.github.io/iplist/data/cncity/150000.txt",
    },
    "安徽IPV4段": {
        "family": "ipv4",
        "url": "https://metowolf.github.io/iplist/data/cncity/340000.txt",
    },
    "CN_IPv6": {
        "family": "ipv6",
        "url": "https://ispip.clang.cn/all_cn_ipv6.txt",
    },
}


def ros_quote(value: str) -> str:
    """
    RouterOS 字符串转义
    """
    value = str(value)
    return '"' + value.replace("\\", "\\\\").replace('"', '\\"') + '"'


def safe_filename(name: str) -> str:
    """
    将 address-list 名称转换为文件名。

    中文文件名本身可以保留，只替换明显不适合作为文件名的字符。
    """
    return (
        name.replace("/", "_")
        .replace("\\", "_")
        .replace(":", "_")
        .replace("*", "_")
        .replace("?", "_")
        .replace('"', "_")
        .replace("<", "_")
        .replace(">", "_")
        .replace("|", "_")
        .replace(" ", "_")
    )


def download_text(url: str) -> str:
    req = urllib.request.Request(
        url,
        headers={
            "User-Agent": "GitHub-Actions-RouterOS-Address-List-Updater"
        },
    )

    with urllib.request.urlopen(req, timeout=60) as resp:
        return resp.read().decode("utf-8", errors="ignore")


def parse_ip_list(text: str, family: str, source_name: str):
    result = set()

    for line_no, raw in enumerate(text.splitlines(), start=1):
        line = raw.strip()

        if not line:
            continue

        if line.startswith("#"):
            continue

        if "#" in line:
            line = line.split("#", 1)[0].strip()

        if not line:
            continue

        try:
            if "/" in line:
                obj = ipaddress.ip_network(line, strict=False)
            else:
                obj = ipaddress.ip_address(line)

            if family == "ipv4" and obj.version != 4:
                raise ValueError("不是 IPv4")

            if family == "ipv6" and obj.version != 6:
                raise ValueError("不是 IPv6")

            result.add(str(obj))

        except Exception as e:
            raise RuntimeError(
                f"{source_name}: 第 {line_no} 行无效: {raw}"
            ) from e

    return sorted(
        result,
        key=lambda x: (
            ipaddress.ip_network(x, strict=False).version,
            int(ipaddress.ip_network(x, strict=False).network_address),
            ipaddress.ip_network(x, strict=False).prefixlen,
        ),
    )


def generate_one_rsc(
    list_name: str,
    family: str,
    url: str,
    addresses,
    stamp: str,
    generated_time: datetime.datetime,
) -> str:
    """
    为单个 address-list 生成一个独立的 RouterOS RSC 文件
    """

    if family == "ipv4":
        menu = "/ip firewall address-list"
    elif family == "ipv6":
        menu = "/ipv6 firewall address-list"
    else:
        raise ValueError(f"Unsupported family: {family}")

    count = len(addresses)

    tmp_list = f"{list_name}__tmp"
    old_list = f"{list_name}__old"

    tag = f"github-feed:{list_name}:{stamp}"
    tag_prefix = f"github-feed:{list_name}:"

    out = []

    out.append("# ==================================================")
    out.append("# Auto generated RouterOS address-list update script")
    out.append(f"# List: {list_name}")
    out.append(f"# Family: {family}")
    out.append(f"# Source: {url}")
    out.append(f"# Entries: {count}")
    out.append(f"# Tag: {tag}")
    out.append(f"# Generated at UTC: {generated_time.isoformat()}Z")
    out.append("# ==================================================")
    out.append("")

    out.append(f":local listName {ros_quote(list_name)}")
    out.append(f":local tmpList {ros_quote(tmp_list)}")
    out.append(f":local oldList {ros_quote(old_list)}")
    out.append(f":local tag {ros_quote(tag)}")
    out.append(f":local tagPrefix {ros_quote(tag_prefix)}")
    out.append(f":local newCount {count}")
    out.append("")

    out.append(
        ':log warning ("Address-List: 开始更新 " . $listName . "，共 " . $newCount . " 条")'
    )
    out.append("")

    # 清理上次失败残留的 tmp list
    out.append("# 清理上次失败残留的 tmp list")
    out.append(f":foreach i in=[{menu} find list=$tmpList] do={{")
    out.append(f"    {menu} remove $i")
    out.append("}")
    out.append("")

    # 清理上次失败残留的 old list
    out.append("# 清理上次失败残留的 old list")
    out.append(f":foreach i in=[{menu} find list=$oldList] do={{")
    out.append(f"    {menu} remove $i")
    out.append("}")
    out.append("")

    # 添加新数据到 tmp
    out.append("# 添加新数据到 tmp list")
    for addr in addresses:
        out.append(
            f"{menu} add "
            f"list=$tmpList "
            f"address={ros_quote(addr)} "
            f"comment=$tag"
        )
    out.append("")

    # 将旧的 github-feed 管理条目移动到 old list
    #
    # 注意：
    # 这里只移动 comment 以 github-feed:LIST_NAME: 开头的条目。
    # 手动添加且 comment 不匹配这个前缀的条目会被保留在正式 list 中。
    out.append("# 将旧的 github-feed 管理条目移动到 old list")
    out.append(f":foreach i in=[{menu} find list=$listName] do={{")
    out.append(f"    :local c [:tostr [{menu} get $i comment]]")
    out.append("    :local p [:find $c $tagPrefix]")
    out.append('    :if ([:typeof $p] != "nil") do={')
    out.append("        :if ($p = 0) do={")
    out.append(f"            {menu} set $i list=$oldList")
    out.append("        }")
    out.append("    }")
    out.append("}")
    out.append("")

    # 将 tmp 移动到正式 list
    out.append("# 将新条目从 tmp list 移动到正式 list")
    out.append(f":foreach i in=[{menu} find list=$tmpList comment=$tag] do={{")
    out.append(f"    {menu} set $i list=$listName")
    out.append("}")
    out.append("")

    # 校验数量
    out.append("# 校验新条目数量")
    out.append(f":local finalCount [:len [{menu} find list=$listName comment=$tag]]")
    out.append(":if ($finalCount != $newCount) do={")
    out.append(
        '    :error ("Address-List: " . $listName . " 更新失败，数量不一致，expected=" . $newCount . ", actual=" . $finalCount)'
    )
    out.append("}")
    out.append("")

    # 删除旧的 github-feed 条目
    out.append("# 删除旧的 github-feed 条目")
    out.append(f":foreach i in=[{menu} find list=$oldList] do={{")
    out.append(f"    {menu} remove $i")
    out.append("}")
    out.append("")

    # 清理 tmp 残留
    out.append("# 清理 tmp 残留")
    out.append(f":foreach i in=[{menu} find list=$tmpList] do={{")
    out.append(f"    {menu} remove $i")
    out.append("}")
    out.append("")

    out.append(
        ':log warning ("Address-List: " . $listName . " 更新完成，共 " . $newCount . " 条")'
    )
    out.append("")

    return "\n".join(out) + "\n"


def generate_rsc_files():
    now = datetime.datetime.utcnow()
    stamp = now.strftime("%Y%m%d%H%M%S")

    dist_dir = Path("dist")
    dist_dir.mkdir(parents=True, exist_ok=True)

    generated_files = []
    total_count = 0

    for list_name, cfg in SOURCES.items():
        family = cfg["family"]
        url = cfg["url"]

        print(f"Downloading {list_name}: {url}")
        text = download_text(url)

        addresses = parse_ip_list(text, family, list_name)
        count = len(addresses)
        total_count += count

        rsc = generate_one_rsc(
            list_name=list_name,
            family=family,
            url=url,
            addresses=addresses,
            stamp=stamp,
            generated_time=now,
        )

        filename = safe_filename(list_name) + ".rsc"
        output_file = dist_dir / filename
        output_file.write_text(rsc, encoding="utf-8", newline="\n")

        generated_files.append(output_file)

        print(f"Generated: {output_file}")
        print(f"List: {list_name}")
        print(f"Family: {family}")
        print(f"Entries: {count}")
        print(f"Size: {output_file.stat().st_size} bytes")
        print("")

    print("Done.")
    print(f"Generated files: {len(generated_files)}")
    print(f"Total entries: {total_count}")

    return generated_files


def main():
    generate_rsc_files()


if __name__ == "__main__":
    main()
