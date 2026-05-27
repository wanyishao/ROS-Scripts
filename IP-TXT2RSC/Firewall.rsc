# ==========================================
# RouterOS RSC Auto Importer
# 支持输入一个或多个 RSC 地址
# 运行期间临时关闭 info -> memory 日志
# ==========================================

# 记录当前启用中的 info memory 日志规则
:local infoMemoryRules [/system logging find where disabled=no topics~"info"]

# 临时关闭 info memory 日志
:if ([:len $infoMemoryRules] > 0) do={
    /system logging disable $infoMemoryRules
    :log warning "RSC-Importer: 已临时关闭 info -> memory 日志"
}

:do {

    :local rscUrls {
# 中国IPv4段
"https://v4.gh-proxy.org/https://raw.githubusercontent.com/wanyishao/ip-txt2rsc/refs/heads/main/dist/CN_IP.rsc";

# 中国IPv6段
"https://v4.gh-proxy.org/https://raw.githubusercontent.com/wanyishao/ip-txt2rsc/refs/heads/main/dist/CN_IPv6.rsc";

# 安徽IPV4段
"https://v4.gh-proxy.org/https://raw.githubusercontent.com/wanyishao/ip-txt2rsc/refs/heads/main/dist/%E5%AE%89%E5%BE%BDIPV4%E6%AE%B5.rsc";

# 内蒙古IPV4段
"https://v4.gh-proxy.org/https://raw.githubusercontent.com/wanyishao/ip-txt2rsc/refs/heads/main/dist/%E5%86%85%E8%92%99%E5%8F%A4IPV4%E6%AE%B5.rsc"
    }

    :local index 0
    :local successCount 0
    :local failCount 0

    :log warning "RSC-Importer: 开始执行 RSC 导入任务"

    :foreach url in=$rscUrls do={

        :set index ($index + 1)

        :local fileName ("auto-import-" . $index . ".rsc")

        :log warning ("RSC-Importer: [" . $index . "] 开始下载: " . $url)

        :do {

            /tool fetch url=$url dst-path=$fileName keep-result=yes check-certificate=no

            :delay 1s

            :if ([:len [/file find name=$fileName]] = 0) do={
                :error ("文件下载失败或不存在: " . $fileName)
            }

            :log warning ("RSC-Importer: [" . $index . "] 下载完成，开始导入: " . $fileName)

            /import file-name=$fileName

            :delay 2s

            /file remove [find name=$fileName]

            :set successCount ($successCount + 1)

            :log warning ("RSC-Importer: [" . $index . "] 导入完成: " . $url)

        } on-error={

            :set failCount ($failCount + 1)

            :log error ("RSC-Importer: [" . $index . "] 下载或导入失败: " . $url)

            :do {
                /file remove [find name=$fileName]
            } on-error={}

        }
    }

    :log warning ("RSC-Importer: 任务结束，成功 " . $successCount . " 个，失败 " . $failCount . " 个")

    # 恢复之前被关闭的 info memory 日志规则
    :if ([:len $infoMemoryRules] > 0) do={
        /system logging enable $infoMemoryRules
        :log warning "RSC-Importer: 已恢复 info -> memory 日志"
    }

} on-error={

    # 如果脚本发生未捕获异常，也恢复日志规则
    :if ([:len $infoMemoryRules] > 0) do={
        /system logging enable $infoMemoryRules
        :log warning "RSC-Importer: 异常退出，已恢复 info -> memory 日志"
    }

    :log error "RSC-Importer: 脚本发生未捕获错误，任务中止"
}
