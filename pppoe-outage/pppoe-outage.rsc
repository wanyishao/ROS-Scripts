:local wanName "WAN"
:local pppoeName "pppoe-out1"

:local stateFile "pppoe-state.txt"
:local logFile "pppoe-outage-log.txt"

:local wanId [/interface ethernet find where name=$wanName]
:local pppoeId [/interface pppoe-client find where name=$pppoeName]

# ==============================
# 初始化文件
# ==============================

:if ([:len [/file find where name=$stateFile]] = 0) do={
    /file add name=$stateFile contents="count=0;fail=0;active=0;startRx=0;startTx=0"
}

:if ([:len [/file find where name=$logFile]] = 0) do={
    /file add name=$logFile contents=""
}

:local stateId [/file find where name=$stateFile]
:local logId [/file find where name=$logFile]

# ==============================
# 读取状态
# ==============================

:local state [/file get $stateId contents]

:local outageCount 0
:local failCount 0
:local active 0
:local startRx 0
:local startTx 0

:local p1 [:find $state "count="]
:local p2 [:find $state ";fail="]
:local p3 [:find $state ";active="]
:local p4 [:find $state ";startRx="]
:local p5 [:find $state ";startTx="]

:if ($p1 != nil) do={
    :set outageCount [:pick $state ($p1 + 6) $p2]
}

:if ($p2 != nil) do={
    :set failCount [:pick $state ($p2 + 6) $p3]
}

:if ($p3 != nil) do={
    :set active [:pick $state ($p3 + 8) $p4]
}

:if ($p4 != nil) do={
    :set startRx [:pick $state ($p4 + 9) $p5]
}

:if ($p5 != nil) do={
    :set startTx [:pick $state ($p5 + 9) [:len $state]]
}

# 转成数字
:set outageCount ($outageCount + 0)
:set failCount ($failCount + 0)
:set active ($active + 0)
:set startRx ($startRx + 0)
:set startTx ($startTx + 0)

# ==============================
# WAN 人工关闭
# ==============================

:if ([/interface ethernet get $wanId disabled] = true) do={

    :set failCount 0
    :set active 0

} else={

    # ==========================
    # PPPoE 已连接
    # ==========================

    :if ([/interface get $pppoeId running] = true) do={

        :if ($active = 1) do={

            :local nowDate [/system clock get date]
            :local nowTime [/system clock get time]

            :local recoveryLine ($nowDate . " " . $nowTime)
            :set recoveryLine ($recoveryLine . " | recovered")
            :set recoveryLine ($recoveryLine . " | outage=" . $outageCount)

            :local oldLog [/file get $logId contents]

            :if ([:len $oldLog] = 0) do={
                /file set $logId contents=$recoveryLine
            } else={
                /file set $logId contents=($oldLog . "\r\n" . $recoveryLine)
            }

            :log info ("PPPoE recovered. Total outages=" . $outageCount)
        }

        :set failCount 0
        :set active 0

    } else={

        # ==========================
        # PPPoE disconnected
        # ==========================

        :local currentRx [/interface get $wanId rx-packet]
        :local currentTx [/interface get $wanId tx-packet]

        # ==========================
        # 第一次发现本轮断网
        # ==========================

        :if ($active = 0) do={

            :set outageCount ($outageCount + 1)
            :set active 1
            :set startRx $currentRx
            :set startTx $currentTx

            :local wanStatus "no-link"

            :if ([/interface get $wanId running] = true) do={
                :set wanStatus "link-ok"
            }

            :local wanRate "unknown"
            :local monData [/interface ethernet monitor $wanId once as-value]

            :if ([:typeof ($monData->"rate")] != "nothing") do={
                :set wanRate ($monData->"rate")
            }

            :local nowDate [/system clock get date]
            :local nowTime [/system clock get time]

            :local logLine ($nowDate . " " . $nowTime)
            :set logLine ($logLine . " | outage=" . $outageCount)
            :set logLine ($logLine . " | pppoe=disconnected")
            :set logLine ($logLine . " | wan=" . $wanStatus)
            :set logLine ($logLine . " | rate=" . $wanRate)
            :set logLine ($logLine . " | rx=" . $currentRx)
            :set logLine ($logLine . " | tx=" . $currentTx)

            :local oldLog [/file get $logId contents]

            :if ([:len $oldLog] = 0) do={
                /file set $logId contents=$logLine
            } else={
                /file set $logId contents=($oldLog . "\r\n" . $logLine)
            }

            :log warning ("PPPoE outage detected. Total outages=" . $outageCount)
        }

        # ==========================
        # 连续失败次数 +1
        # ==========================

        :set failCount ($failCount + 1)

        :log warning ("PPPoE disconnected, failure count=" . $failCount)

        # ==========================
        # 连续失败3次，诊断并重置
        # ==========================

        :if ($failCount >= 3) do={

            :local rxDelta ($currentRx - $startRx)
            :local txDelta ($currentTx - $startTx)

            :local txHang "no"

            :if ($rxDelta > 0) do={
                :if ($txDelta = 0) do={
                    :set txHang "yes"
                }
            }

            :local nowDate [/system clock get date]
            :local nowTime [/system clock get time]

            :local diagLine ($nowDate . " " . $nowTime)
            :set diagLine ($diagLine . " | diagnostic")
            :set diagLine ($diagLine . " | outage=" . $outageCount)
            :set diagLine ($diagLine . " | rx-delta=" . $rxDelta)
            :set diagLine ($diagLine . " | tx-delta=" . $txDelta)
            :set diagLine ($diagLine . " | suspected-tx-hang=" . $txHang)

            :local oldLog [/file get $logId contents]

            :if ([:len $oldLog] = 0) do={
                /file set $logId contents=$diagLine
            } else={
                /file set $logId contents=($oldLog . "\r\n" . $diagLine)
            }

            :log warning ("PPPoE recovery: resetting WAN. TX hang=" . $txHang)

            /interface ethernet disable $wanId
            :delay 3s
            /interface ethernet enable $wanId

            :set failCount 0

            :log warning "PPPoE recovery: WAN reset completed"
        }
    }
}

# ==============================
# 最后统一保存状态
# ==============================

:local newState ("count=" . $outageCount)
:set newState ($newState . ";fail=" . $failCount)
:set newState ($newState . ";active=" . $active)
:set newState ($newState . ";startRx=" . $startRx)
:set newState ($newState . ";startTx=" . $startTx)

/file set $stateId contents=$newState
