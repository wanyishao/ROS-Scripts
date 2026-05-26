:local fileName "vnstat_db.txt"
:local f [/file find name=$fileName]

:if ([:len $f] = 0) do={ :put "Error: File $fileName not found."; :return }

:local content [/file get $f contents]
:local lines [:toarray ""]

:local pos 0
:while ($pos < [:len $content]) do={
    :local nextPos [:find $content "\r\n" $pos]
    :if ([:typeof $nextPos] = "nil") do={ :set nextPos [:len $content] }
    :local line [:pick $content $pos $nextPos]
    :if ([:len $line] > 5) do={ :set lines ($lines , $line) }
    :set pos ($nextPos + 2)
}

:put "\n================== [ vnStat Traffic Report ] =================="

# --- 内部函数：格式化单位 (MB -> GB 适配) ---
:local formatUnit do={
    :local val [:tonum $1]
    :if ($val >= 1024) do={
        # 计算 GB 整数部分和小数部分 (取2位)
        :local gb ($val / 1024)
        :local dec (($val * 100 / 1024) % 100)
        :if ($dec < 10) do={ :set dec ("0" . $dec) }
        :return ($gb . "." . $dec . " GB")
    }
    :return ($val . " MB")
}

# --- Section 1: Monthly Summary ---
:put "\n[ MONTHLY SUMMARY ]"
:put "  MONTH        | DOWNLOAD    | UPLOAD      | TOTAL"
:put "--------------------------------------------------------------"

:local currentMonthYear ""
:local mRx 0; :local mTx 0

:foreach item in=$lines do={
    :local dayData [:toarray $item]
    :if ([:len $dayData] >= 3) do={
        :local dDate [:tostr [:pick $dayData 0]]
        :local dRx [:tonum [:pick $dayData 1]]
        :local dTx [:tonum [:pick $dayData 2]]
        
        :local mY ""
        :if ([:find $dDate "-"] > 0) do={ :set mY [:pick $dDate 0 7] } else={ :set mY ([:pick $dDate 0 3] . " " . [:pick $dDate 7 11]) }

        :if ($currentMonthYear = "") do={ :set currentMonthYear $mY }
        
        :if ($mY != $currentMonthYear) do={
            :put ("  " . $currentMonthYear . "      | " . [$formatUnit $mRx] . "     | " . [$formatUnit $mTx] . "     | " . [$formatUnit ($mRx+$mTx)])
            :set mRx $dRx; :set mTx $dTx
            :set currentMonthYear $mY
        } else={
            :set mRx ($mRx + $dRx); :set mTx ($mTx + $dTx)
        }
    }
}
:put ("  " . $currentMonthYear . "      | " . [$formatUnit $mRx] . "     | " . [$formatUnit $mTx] . "     | " . [$formatUnit ($mRx+$mTx)])

# --- Section 2: Last 7 Days Detail ---
:put "\n[ LAST 7 DAYS ]"
:put "  DATE         | DOWNLOAD    | UPLOAD      | TOTAL"
:put "--------------------------------------------------------------"

:local limit [:len $lines]
:if ($limit > 7) do={ :set limit 7 }

:for i from=0 to=($limit - 1) do={
    :local dayData [:toarray [:pick $lines $i]]
    :local dDate [:tostr [:pick $dayData 0]]
    :local dRx [:tonum [:pick $dayData 1]]
    :local dTx [:tonum [:pick $dayData 2]]
    
    # 使用 formatUnit 函数自动转换单位
    :put ("  " . $dDate . "   | " . [$formatUnit $dRx] . "     | " . [$formatUnit $dTx] . "     | " . [$formatUnit ($dRx+$dTx)])
}

:put "==============================================================\n"
