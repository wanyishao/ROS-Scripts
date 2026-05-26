# ==========================================
# Cloudflare DDNS 统一脚本
# 支持：
# 1. 公网 IPv4 -> Cloudflare A 记录
# 2. 下游设备 IPv6 Address-List -> Cloudflare AAAA 记录
# 3. 路由器自身 IPv6 自动写入 routeros Address-List
# 4. 指定 Address-List 仅更新 IPv6 前缀，用于防火墙放行
# ==========================================


# ==========================================
# 阶段一：基础配置
# ==========================================

:local cfToken ""
:local zoneID  ""

# IPv4 WAN 接口
:local wanIf ""

# IPv6 地址池
:local poolName ""

# 路由器 LAN IPv6 所在接口
:local routerIPv6If ""

# 路由器自身 IPv6 写入哪个 IPv6 firewall address-list
:local routerListName "list1"


# ==========================================
# 阶段二：DNS 与 Address-List 映射配置
# ==========================================

# -------- 1. 需要更新为公网 IPv4 的 A 记录 --------
# 这些域名都会指向当前 WAN IPv4
:local ipv4Targets {
    "*.example.com";
    "a.example.com"
}


# -------- 2. 需要同步到 Cloudflare AAAA 的 IPv6 设备 --------
# 格式: "Address-List名称,完整域名"
:local deviceIPv6Targets {
    "list1,*.example.com";
    "list2,a.example.com"
}


# -------- 3. 仅更新 IPv6 前缀、不更新 Cloudflare 的 Address-List --------
# 用途：防火墙放行固定设备
# 这些列表中的 IPv6 会自动替换为当前 IPv6 前缀，但不会更新 DNS

:local localIPv6OnlyLists {
    "list3";
    "list4"
}


# ==========================================
# 阶段三：获取当前公网 IPv4
# ==========================================

:local currentIPv4 ""

:do {
    :local ipIDs [/ip address find interface=$wanIf dynamic=yes disabled=no]

    :if ([:len $ipIDs] > 0) do={
        :local addr [/ip address get [:pick $ipIDs 0] address]

        :if ([:find $addr "/"] != -1) do={
            :set currentIPv4 [:pick $addr 0 [:find $addr "/"]]
        } else={
            :set currentIPv4 $addr
        }
    }
} on-error={
    :log error "DDNS: 获取 IPv4 地址失败，请检查 WAN 接口 $wanIf"
}

:if ([:len $currentIPv4] = 0) do={
    :log warning "DDNS: 当前 IPv4 为空，A 记录不会更新"
}


# ==========================================
# 阶段四：获取当前 IPv6 前缀
# ==========================================

:local currentPrefix ""

:do {
    /ipv6 pool {
        :local poolID [find name=$poolName]

        :if ([:len $poolID] > 0) do={
            :local fullPrefix [get [:pick $poolID 0] prefix]

            :if ([:find $fullPrefix "::"] != -1) do={
                :set currentPrefix [:pick $fullPrefix 0 [:find $fullPrefix "::"]]
            }
        }
    }
} on-error={
    :log error "IPv6_DDNS: 获取 IPv6 地址池 $poolName 失败"
}

:if ([:len $currentPrefix] = 0) do={
    :log warning "IPv6_DDNS: 找不到地址池 $poolName 或前缀为空，IPv6 前缀不会更新"
}


# ==========================================
# 阶段五：获取路由器自身 IPv6，并写入 routeros Address-List
# ==========================================

:local routerIPv6 ""

:do {
    :local v6IDs [/ipv6 address find interface=$routerIPv6If from-pool=$poolName disabled=no]

    :if ([:len $v6IDs] > 0) do={
        :local addr [/ipv6 address get [:pick $v6IDs 0] address]

        :if ([:find $addr "/"] != -1) do={
            :set routerIPv6 [:pick $addr 0 [:find $addr "/"]]
        } else={
            :set routerIPv6 $addr
        }
    }
} on-error={
    :log error "IPv6_DDNS: 获取路由器自身 IPv6 地址失败，请检查接口 $routerIPv6If 和地址池 $poolName"
}

:if ([:len $routerIPv6] > 0) do={

    /ipv6 firewall address-list {

        :local routerItems [find list=$routerListName]

        :if ([:len $routerItems] > 0) do={

            :local oldRouterAddr [get [:pick $routerItems 0] address]

            :if ([:find $oldRouterAddr "/"] != -1) do={
                :set oldRouterAddr [:pick $oldRouterAddr 0 [:find $oldRouterAddr "/"]]
            }

            :if ($oldRouterAddr != $routerIPv6) do={
                set [:pick $routerItems 0] address=$routerIPv6
                :log info "IPv6_DDNS: 路由器自身 IPv6 已更新到 address-list [$routerListName] -> $routerIPv6"
            }

        } else={

            add list=$routerListName address=$routerIPv6 comment="router-self-ddns"
            :log info "IPv6_DDNS: 已创建 address-list [$routerListName] -> $routerIPv6"
        }
    }

} else={
    :log warning "IPv6_DDNS: 当前路由器 IPv6 为空，无法更新 address-list [$routerListName]"
}


# ==========================================
# 阶段六：更新需要同步 Cloudflare 的 IPv6 Address-List 前缀
# ==========================================

:if ([:len $currentPrefix] > 0) do={

    /ipv6 firewall address-list {

        :foreach target in=$deviceIPv6Targets do={

            :local commaPos [:find $target ","]
            :local lName [:pick $target 0 $commaPos]

            # routeros 是路由器自身地址，已经在上一阶段用真实地址更新过，这里跳过前缀拼接
            :if ($lName != $routerListName) do={

                :local items [find list=$lName]

                :foreach i in=$items do={

                    :local oldFullAddr [get $i address]
                    :local oldAddrOnly $oldFullAddr

                    :if ([:find $oldFullAddr "/"] != -1) do={
                        :set oldAddrOnly [:pick $oldFullAddr 0 [:find $oldFullAddr "/"]]
                    }

                    :local addrStr $oldAddrOnly
                    :local addrLen [:len $addrStr]
                    :local colons 0
                    :local suffixPos 0

                    # 从右往左找第 4 个冒号，保留后 4 段作为设备后缀
                    :for j from=($addrLen - 1) to=0 step=-1 do={

                        :if ([:pick $addrStr $j ($j + 1)] = ":") do={

                            :set colons ($colons + 1)

                            :if ($colons = 4) do={
                                :set suffixPos $j
                                :set j -1
                            }
                        }
                    }

                    :if ($suffixPos > 0) do={

                        :local suffix [:pick $addrStr $suffixPos $addrLen]
                        :local expectedAddr ($currentPrefix . $suffix)

                        :if ($oldAddrOnly != $expectedAddr) do={
                            set $i address=$expectedAddr
                            :log info "IPv6_DDNS: [$lName] 本地地址列表已更新为 $expectedAddr"
                        }
                    }
                }
            }
        }
    }
}


# ==========================================
# 阶段七：更新仅用于防火墙的 IPv6 Address-List 前缀
# 不同步 Cloudflare
# ==========================================

:if ([:len $currentPrefix] > 0) do={

    /ipv6 firewall address-list {

        :foreach lName in=$localIPv6OnlyLists do={

            :local items [find list=$lName]

            :if ([:len $items] > 0) do={

                :foreach i in=$items do={

                    :local oldFullAddr [get $i address]
                    :local oldAddrOnly $oldFullAddr

                    :if ([:find $oldFullAddr "/"] != -1) do={
                        :set oldAddrOnly [:pick $oldFullAddr 0 [:find $oldFullAddr "/"]]
                    }

                    :local addrStr $oldAddrOnly
                    :local addrLen [:len $addrStr]
                    :local colons 0
                    :local suffixPos 0

                    # 从右往左找第 4 个冒号，保留后 4 段作为设备后缀
                    :for j from=($addrLen - 1) to=0 step=-1 do={

                        :if ([:pick $addrStr $j ($j + 1)] = ":") do={

                            :set colons ($colons + 1)

                            :if ($colons = 4) do={
                                :set suffixPos $j
                                :set j -1
                            }
                        }
                    }

                    :if ($suffixPos > 0) do={

                        :local suffix [:pick $addrStr $suffixPos $addrLen]
                        :local expectedAddr ($currentPrefix . $suffix)

                        :if ($oldAddrOnly != $expectedAddr) do={
                            set $i address=$expectedAddr
                            :log info "IPv6_DDNS: 防火墙列表 [$lName] 已更新为 $expectedAddr"
                        }
                    }

                }

            } else={
                :log warning "IPv6_DDNS: 防火墙 IPv6 address-list [$lName] 不存在或为空，无法自动更新前缀"
            }
        }
    }
}


# ==========================================
# 阶段八：同步 IPv4 A 记录到 Cloudflare
# ==========================================

:if ([:len $currentIPv4] > 0) do={

    :foreach rName in=$ipv4Targets do={

        :do {

            :local getUrl ("https://api.cloudflare.com/client/v4/zones/" . $zoneID . "/dns_records?name=" . $rName . "&type=A")

            :local getResult [/tool fetch \
                http-method=get \
                mode=https \
                url=$getUrl \
                http-header-field=("Authorization: Bearer " . $cfToken . ",Content-Type: application/json") \
                as-value \
                output=user]

            :local jsonObj [:deserialize from=json value=($getResult->"data")]
            :local records ($jsonObj->"result")

            :if ([:len $records] > 0) do={

                :local recordID ($records->0->"id")
                :local cfAddr ($records->0->"content")

                :if ($cfAddr != $currentIPv4) do={

                    :log warning "DDNS: $rName A 记录变动，Cloudflare=$cfAddr，本地=$currentIPv4，开始更新..."

                    :local putUrl ("https://api.cloudflare.com/client/v4/zones/" . $zoneID . "/dns_records/" . $recordID)

                    :local putData ("{\"type\":\"A\",\"name\":\"" . $rName . "\",\"content\":\"" . $currentIPv4 . "\",\"ttl\":120,\"proxied\":false}")

                    /tool fetch \
                        http-method=put \
                        mode=https \
                        url=$putUrl \
                        http-header-field=("Authorization: Bearer " . $cfToken . ",Content-Type: application/json") \
                        http-data=$putData \
                        keep-result=no

                    :log warning "DDNS: 已成功更新 $rName A -> $currentIPv4"
                }

            } else={
                :log error "DDNS: Cloudflare 中找不到 $rName 的 A 记录，请先添加"
            }

        } on-error={
            :log error "DDNS: 更新 $rName A 记录失败，请检查 API Token、Zone ID、网络或 Cloudflare 记录"
        }
    }
}


# ==========================================
# 阶段九：同步下游设备 AAAA 记录到 Cloudflare
# ==========================================

/ipv6 firewall address-list {

    :foreach target in=$deviceIPv6Targets do={

        :local commaPos [:find $target ","]
        :local lName [:pick $target 0 $commaPos]
        :local rName [:pick $target ($commaPos + 1) [:len $target]]

        :local itemID [find list=$lName]

        :if ([:len $itemID] > 0) do={

            :local currentListAddr [get [:pick $itemID 0] address]

            :if ([:find $currentListAddr "/"] != -1) do={
                :set currentListAddr [:pick $currentListAddr 0 [:find $currentListAddr "/"]]
            }

            :if ([:len $currentListAddr] > 0) do={

                :do {

                    :local getUrl ("https://api.cloudflare.com/client/v4/zones/" . $zoneID . "/dns_records?name=" . $rName . "&type=AAAA")

                    :local getResult [/tool fetch \
                        http-method=get \
                        mode=https \
                        url=$getUrl \
                        http-header-field=("Authorization: Bearer " . $cfToken . ",Content-Type: application/json") \
                        as-value \
                        output=user]

                    :local jsonObj [:deserialize from=json value=($getResult->"data")]
                    :local records ($jsonObj->"result")

                    :if ([:len $records] > 0) do={

                        :local recordID ($records->0->"id")
                        :local cfAddr ($records->0->"content")

                        :if ($cfAddr != $currentListAddr) do={

                            :log warning "IPv6_DDNS: $rName AAAA 记录变动，Cloudflare=$cfAddr，本地=$currentListAddr，开始更新..."

                            :local putUrl ("https://api.cloudflare.com/client/v4/zones/" . $zoneID . "/dns_records/" . $recordID)

                            :local putData ("{\"type\":\"AAAA\",\"name\":\"" . $rName . "\",\"content\":\"" . $currentListAddr . "\",\"ttl\":120,\"proxied\":false}")

                            /tool fetch \
                                http-method=put \
                                mode=https \
                                url=$putUrl \
                                http-header-field=("Authorization: Bearer " . $cfToken . ",Content-Type: application/json") \
                                http-data=$putData \
                                keep-result=no

                            :log warning "IPv6_DDNS: 已成功更新 [$lName] $rName AAAA -> $currentListAddr"
                        }

                    } else={
                        :log error "IPv6_DDNS: Cloudflare 中找不到 $rName 的 AAAA 记录，请先添加"
                    }

                } on-error={
                    :log error "IPv6_DDNS: 更新设备 [$lName] $rName AAAA 记录失败，请检查 API Token、Zone ID、网络或 Cloudflare 记录"
                }
            }

        } else={
            :log error "IPv6_DDNS: 在 IPv6 Firewall Address-List 中找不到名为 [$lName] 的设备"
        }
    }
}

# 高频运行建议保持注释
:log info "DDNS: 任务完成"
