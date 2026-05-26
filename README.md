RouterOS (ROS) 实用脚本集合，包含功能强大的 Cloudflare DDNS 脚本和轻量级的 vnStat 接口流量统计脚本。

## 目录
- [1. Cloudflare DDNS 统一脚本](#1-cloudflare-ddns-统一脚本)
- [2. 流量统计工具 (vnStat for ROS)](#2-流量统计工具-vnstat-for-ros)


---

## 1. Cloudflare DDNS 统一脚本

位于 `DDNS/DDNS.rsc`。这是一个多功能的 DDNS 脚本，不仅支持传统的 IPv4 A 记录更新，还特别针对 IPv6 动态前缀和 RouterOS 防火墙 (Firewall Address List) 进行了深度适配。

### ✨ 功能特点
- **公网 IPv4 同步**：自动获取 WAN 口 IPv4 地址，更新至 Cloudflare A 记录。
- **IPv6 前缀更新**：动态获取 IPv6 地址池 (Pool) 前缀，自动更新指定的 Firewall Address List 中的设备 IPv6 后缀（用于防火墙放行固定设备，不更新至 Cloudflare）。
- **路由器自身 IPv6 同步**：自动获取路由器 LAN 侧 IPv6 地址，写入 Address List。
- **下游设备 AAAA 记录同步**：读取 Address List 中拼接好的设备 IPv6，同步更新至 Cloudflare AAAA 记录。

### 🚀 使用方法
1. 打开脚本 `DDNS.rsc`，在“阶段一：基础配置”和“阶段二：DNS 与 Address-List 映射配置”中填写你的专属参数：
   - `cfToken`: Cloudflare API Token。
   - `zoneID`: Cloudflare 域名的 Zone ID。
   - `wanIf`: 你的 WAN 口名称（用于获取公网 IPv4，如 `pppoe-out1`）。
   - `poolName`: 你的 IPv6 地址池名称。
   - `routerIPv6If`: 路由器 LAN IPv6 所在接口。
   - `ipv4Targets` / `deviceIPv6Targets` / `localIPv6OnlyLists`: 根据注释配置需要更新的域名和 Address-list 映射关系。
2. 将修改后的脚本粘贴到 RouterOS 的 `System` -> `Scripts` 中，命名为 `DDNS`。
3. 在 `System` -> `Scheduler` 中添加计划任务，建议每 1~5 分钟执行一次：



```routeros
/system script run DDNS
```

---

## 2. 流量统计工具 (vnStat for ROS)

位于 `vnstat/` 目录下。这是一套模仿 Linux 下 `vnstat` 的轻量级流量统计脚本，用于记录并持久化保存某个接口（如 WAN 口）的每日流量，支持生成直观的文本报告。

### ✨ 功能特点

* **断电不丢数据**：将数据暂存到 Script Comment 中，每日归档到 RouterOS 的 `vnstat_db.txt` 文件中。
* **自动重置与单位自适应**：处理重新拨号后的计数器清零问题；报告自动在 MB 和 GB 之间无缝切换。
* **多维度报表**：提供“按月汇总 (Monthly Summary)”和“最近 7 天 (Last 7 Days)”的直观流量报表。

### 🚀 包含脚本及使用方法

本套件包含三个脚本，需要配合 Scheduler 使用：

#### 1. `vnstat_acc.rsc` (流量累加器)

* **配置**：打开脚本，将 `:local interface ""` 修改为你要监控的接口（例如 `:local interface "pppoe-out1"`）。
* **部署**：添加到 `System` -> `Scripts`，命名为 `vnstat_acc`。
* **计划任务**：添加 Scheduler，建议 **每 1 分钟** 运行一次：
```routeros
/system script run vnstat_acc

```



#### 2. `vnstat_daily_job.rsc` (每日归档)

* **部署**：无需修改，直接添加到 `System` -> `Scripts`，命名为 `vnstat_daily_job`。
* **计划任务**：添加 Scheduler，每天 **23:59:50** 运行一次：
```routeros
/system script run vnstat_daily_job

```


*(该脚本会将当天的数据写入 `vnstat_db.txt` 并清零当天计数，最多保留最近 365 天的数据)*

#### 3. `vnstat_report.rsc` (生成报表)

* **部署**：添加到 `System` -> `Scripts`，命名为 `vnstat_report`。
* **查看报表**：无需添加计划任务。随时在 RouterOS 终端 (New Terminal) 中运行以下命令查看流量报告：
```routeros
/system script run vnstat_report

```


**报告示例：**
```text
================== [ vnStat Traffic Report ] ==================

[ MONTHLY SUMMARY ]
  MONTH        | DOWNLOAD    | UPLOAD      | TOTAL
--------------------------------------------------------------
  2024-05      | 150.25 GB   | 20.10 GB    | 170.35 GB

[ LAST 7 DAYS ]
  DATE         | DOWNLOAD    | UPLOAD      | TOTAL
--------------------------------------------------------------
  2024-05-25   | 5.12 GB     | 1.05 GB     | 6.17 GB
==============================================================

```



---

## 开源协议

本项目采用 [GNU General Public License v3.0 (GPL-3.0)](https://www.google.com/search?q=LICENSE) 协议开源。
