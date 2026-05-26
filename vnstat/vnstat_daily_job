:global vRx; :global vTx; :global vLastRx; :global vLastTx
:local date [/system clock get date]
:local fileName "vnstat_db.txt"

# --- 关键修改：校验当天是否有流量 ---
# 如果 vRx 和 vTx 都是 0，说明今天没有数据或者脚本被重复运行了
:if ([:tonum $vRx] = 0 && [:tonum $vTx] = 0) do={
    :log info "vnStat: No traffic recorded for $date, skipping file write."
    # 依然执行重置逻辑，确保环境干净
    :set vRx 0; :set vTx 0; :set vLastRx 0; :set vLastTx 0
    /system script set [find name=vnstat_acc] comment="0|0"
    :return ""
}

# 1. 确保文件存在 (首次运行初始化)
:if ([:len [/file find name=$fileName]] = 0) do={
    /file print file=$fileName where name=$fileName;
    /delay 1s;
    /file set $fileName contents=""
}

# 2. 获取文件 ID
:local fileID [/file find name=$fileName]

# 3. 读取旧数据
:local vHistory [/file get $fileID contents]

# 4. 构造新行 (日期,下载MB,上传MB)
:local newEntry ("$date,$vRx,$vTx\r\n")
:local newContent ($newEntry . $vHistory)

# 5. 修剪数据：只保留最近 365 行
:local lineCount 0
:local finalContent ""
:local pos 0
:local totalLen [:len $newContent]

:while ($lineCount < 365 && $pos < $totalLen) do={
    :local nextPos [:find $newContent "\r\n" $pos]
    :if ([:typeof $nextPos] = "nil") do={ :set nextPos $totalLen }
    
    :set finalContent ($finalContent . [:pick $newContent $pos ($nextPos + 2)])
    :set pos ($nextPos + 2)
    :set lineCount ($lineCount + 1)
}

# 6. 写入 SSD
/file set $fileID contents=$finalContent

# 7. 重置当天计数与持久化备注
:set vRx 0; :set vTx 0; :set vLastRx 0; :set vLastTx 0
/system script set [find name=vnstat_acc] comment="0|0"

:log info "vnStat: Traffic for $date ($newEntry) saved to $fileName"
