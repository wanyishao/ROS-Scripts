#填写wan口网口
:local interface ""


:global vRx; :global vTx; :global vLastRx; :global vLastTx

# 1. 变量初始化与断电恢复
:if ([:typeof $vRx] = "nothing") do={
    :local saved [/system script get [find name=vnstat_acc] comment]
    :if ([:find $saved "|"] > 0) do={
        :set vRx [:tonum [:pick $saved 0 [:find $saved "|"]]]
        :set vTx [:tonum [:pick $saved ([:find $saved "|"] + 1) [:len $saved]]]
    } else={ :set vRx 0; :set vTx 0 }
}

# 2. 获取接口实时数据
/interface
:if ([:len [find name=$interface]] > 0) do={
    :local curR [get [find name=$interface] rx-byte]
    :local curT [get [find name=$interface] tx-byte]
    
    # --- 关键修正：初始化上次记录点 ---
    # 如果 vLastRx 是 0 (比如刚开机或刚执行完 daily_job)，
    # 先同步为当前值，这样下一分钟开始计算的就是纯增量，而不是把总流量吞掉。
    :if ($vLastRx = 0) do={
        :set vLastRx $curR
        :set vLastTx $curT
    }

    # 3. 处理重拨清零 (如果接口数值变小，说明重新拨号了)
    :if ($curR < $vLastRx) do={
        :set vLastRx $curR
        :set vLastTx $curT
    }
    
    # 4. 计算自上一分钟以来的增量 (MB)
    :local dR (($curR - $vLastRx) / 1048576)
    :local dT (($curT - $vLastTx) / 1048576)
    
    # 5. 只有产生 > 1MB 的变动时才更新累加器和持久化
    :if ($dR > 0 || $dT > 0) do={
        :set vRx ($vRx + $dR)
        :set vTx ($vTx + $dT)
        # 更新记录点为当前位置，为下一分钟做准备
        :set vLastRx $curR
        :set vLastTx $curT
        
        # 持久化：存的是【今天已经用掉的 MB 总数】
        /system script set [find name=vnstat_acc] comment=("$vRx|$vTx")
    }
}
