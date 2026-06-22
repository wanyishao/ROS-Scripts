# ==================================================
# Auto generated RouterOS address-list update script
# List: 安徽IPV4段
# Family: ipv4
# Source: https://metowolf.github.io/iplist/data/cncity/340000.txt
# Entries: 298
# Tag: github-feed:安徽IPV4段:20260622220132
# Generated at UTC: 2026-06-22T22:01:32.935658Z
# ==================================================

:local listName "安徽IPV4段"
:local tmpList "安徽IPV4段__tmp"
:local oldList "安徽IPV4段__old"
:local tag "github-feed:安徽IPV4段:20260622220132"
:local tagPrefix "github-feed:安徽IPV4段:"
:local newCount 298

:log warning ("Address-List: 开始更新 " . $listName . "，共 " . $newCount . " 条")

# 清理上次失败残留的 tmp list
:foreach i in=[/ip firewall address-list find list=$tmpList] do={
    /ip firewall address-list remove $i
}

# 清理上次失败残留的 old list
:foreach i in=[/ip firewall address-list find list=$oldList] do={
    /ip firewall address-list remove $i
}

# 添加新数据到 tmp list
/ip firewall address-list add list=$tmpList address="1.51.64.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="27.54.192.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="36.4.0.0/14" comment=$tag
/ip firewall address-list add list=$tmpList address="36.32.0.0/14" comment=$tag
/ip firewall address-list add list=$tmpList address="36.56.0.0/13" comment=$tag
/ip firewall address-list add list=$tmpList address="36.134.84.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="36.137.38.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="36.138.68.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="36.138.243.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="36.140.125.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="36.140.164.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="36.140.231.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="36.159.128.0/17" comment=$tag
/ip firewall address-list add list=$tmpList address="36.161.0.0/16" comment=$tag
/ip firewall address-list add list=$tmpList address="36.192.157.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="36.192.158.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="36.192.160.0/21" comment=$tag
/ip firewall address-list add list=$tmpList address="36.192.168.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="36.192.170.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="36.213.51.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="36.213.205.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="39.134.120.0/21" comment=$tag
/ip firewall address-list add list=$tmpList address="39.134.128.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="39.134.132.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="39.137.58.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="39.137.60.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="39.144.34.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="39.144.36.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="39.144.38.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="39.144.159.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="39.144.160.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="39.144.162.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="42.157.0.0/17" comment=$tag
/ip firewall address-list add list=$tmpList address="42.157.136.0/21" comment=$tag
/ip firewall address-list add list=$tmpList address="42.157.144.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.3.104/29" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.3.112/29" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.5.184/29" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.5.192/29" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.13.112/28" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.14.32/28" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.15.240/28" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.17.208/28" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.18.224/28" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.24.64/28" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.24.128/28" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.24.208/28" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.26.0/28" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.26.192/28" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.27.144/28" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.28.224/27" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.29.96/28" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.29.160/27" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.30.48/28" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.30.80/28" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.31.32/28" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.32.112/28" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.32.192/28" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.32.224/28" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.35.32/27" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.35.80/28" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.39.32/27" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.41.80/28" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.42.64/28" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.42.208/28" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.43.80/28" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.43.160/27" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.45.64/28" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.46.192/28" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.53.128/26" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.54.0/26" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.54.64/27" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.55.96/27" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.58.64/28" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.61.128/28" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.63.32/28" comment=$tag
/ip firewall address-list add list=$tmpList address="43.224.80.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="43.248.20.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="43.251.232.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="45.122.4.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="45.251.120.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="45.253.122.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="45.254.28.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="45.254.211.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="45.254.212.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="45.254.216.0/21" comment=$tag
/ip firewall address-list add list=$tmpList address="45.254.224.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="45.254.228.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="58.195.83.48/28" comment=$tag
/ip firewall address-list add list=$tmpList address="58.195.87.64/28" comment=$tag
/ip firewall address-list add list=$tmpList address="58.195.99.96/27" comment=$tag
/ip firewall address-list add list=$tmpList address="58.200.29.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="58.242.0.0/15" comment=$tag
/ip firewall address-list add list=$tmpList address="59.81.80.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="59.152.38.64/29" comment=$tag
/ip firewall address-list add list=$tmpList address="60.166.0.0/15" comment=$tag
/ip firewall address-list add list=$tmpList address="60.168.0.0/13" comment=$tag
/ip firewall address-list add list=$tmpList address="61.45.128.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="61.132.128.0/17" comment=$tag
/ip firewall address-list add list=$tmpList address="61.133.128.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="61.190.0.0/15" comment=$tag
/ip firewall address-list add list=$tmpList address="61.235.36.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="61.235.40.0/21" comment=$tag
/ip firewall address-list add list=$tmpList address="61.237.176.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="61.241.128.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="101.46.0.0/19" comment=$tag
/ip firewall address-list add list=$tmpList address="101.49.206.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="101.76.128.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="101.105.64.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="103.8.32.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="103.14.132.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="103.22.16.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="103.22.255.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="103.28.204.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="103.39.88.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="103.43.104.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="103.63.72.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="103.71.68.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="103.74.80.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="103.142.96.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="103.179.78.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="103.186.4.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="103.189.92.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="103.192.57.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="103.214.48.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="103.216.136.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="103.220.92.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="103.240.72.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="103.253.224.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="110.122.0.0/15" comment=$tag
/ip firewall address-list add list=$tmpList address="111.38.0.0/16" comment=$tag
/ip firewall address-list add list=$tmpList address="111.39.0.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="111.39.4.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="111.39.8.0/21" comment=$tag
/ip firewall address-list add list=$tmpList address="111.39.16.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="111.39.32.0/19" comment=$tag
/ip firewall address-list add list=$tmpList address="111.39.64.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="111.39.128.0/17" comment=$tag
/ip firewall address-list add list=$tmpList address="112.26.0.0/15" comment=$tag
/ip firewall address-list add list=$tmpList address="112.28.0.0/14" comment=$tag
/ip firewall address-list add list=$tmpList address="112.32.0.0/16" comment=$tag
/ip firewall address-list add list=$tmpList address="112.33.64.0/19" comment=$tag
/ip firewall address-list add list=$tmpList address="112.33.96.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="112.33.104.0/21" comment=$tag
/ip firewall address-list add list=$tmpList address="112.33.120.0/21" comment=$tag
/ip firewall address-list add list=$tmpList address="112.33.128.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="112.33.192.0/19" comment=$tag
/ip firewall address-list add list=$tmpList address="112.33.224.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="112.33.240.0/21" comment=$tag
/ip firewall address-list add list=$tmpList address="112.33.248.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="112.34.0.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="112.34.64.0/19" comment=$tag
/ip firewall address-list add list=$tmpList address="112.34.96.0/21" comment=$tag
/ip firewall address-list add list=$tmpList address="112.34.104.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="112.34.108.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="112.34.120.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="112.34.126.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="112.34.128.0/17" comment=$tag
/ip firewall address-list add list=$tmpList address="112.53.227.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="112.53.228.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="112.53.231.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="112.53.232.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="112.53.236.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="112.53.238.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="112.59.0.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="112.122.0.0/16" comment=$tag
/ip firewall address-list add list=$tmpList address="112.123.0.0/17" comment=$tag
/ip firewall address-list add list=$tmpList address="112.123.128.0/21" comment=$tag
/ip firewall address-list add list=$tmpList address="112.123.137.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="112.123.138.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="112.123.140.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="112.123.144.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="112.123.160.0/19" comment=$tag
/ip firewall address-list add list=$tmpList address="112.123.192.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="112.132.0.0/16" comment=$tag
/ip firewall address-list add list=$tmpList address="114.96.0.0/13" comment=$tag
/ip firewall address-list add list=$tmpList address="114.104.0.0/14" comment=$tag
/ip firewall address-list add list=$tmpList address="114.213.128.0/17" comment=$tag
/ip firewall address-list add list=$tmpList address="114.214.128.0/17" comment=$tag
/ip firewall address-list add list=$tmpList address="115.33.64.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="115.120.176.0/21" comment=$tag
/ip firewall address-list add list=$tmpList address="115.168.40.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="115.168.72.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="116.149.56.0/21" comment=$tag
/ip firewall address-list add list=$tmpList address="116.149.64.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="116.149.128.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="116.149.192.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="116.149.208.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="116.149.212.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="116.149.214.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="117.57.0.0/16" comment=$tag
/ip firewall address-list add list=$tmpList address="117.64.0.0/13" comment=$tag
/ip firewall address-list add list=$tmpList address="117.136.20.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="117.136.100.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="117.136.116.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="117.136.118.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="118.84.1.88/30" comment=$tag
/ip firewall address-list add list=$tmpList address="118.84.1.94/31" comment=$tag
/ip firewall address-list add list=$tmpList address="118.84.2.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="118.215.192.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="118.215.196.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="118.215.207.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="118.215.208.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="118.215.217.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="118.215.218.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="118.215.220.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="120.193.64.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="120.209.0.0/16" comment=$tag
/ip firewall address-list add list=$tmpList address="120.210.0.0/16" comment=$tag
/ip firewall address-list add list=$tmpList address="120.242.0.0/15" comment=$tag
/ip firewall address-list add list=$tmpList address="121.194.14.240/29" comment=$tag
/ip firewall address-list add list=$tmpList address="121.251.0.0/17" comment=$tag
/ip firewall address-list add list=$tmpList address="121.255.0.0/16" comment=$tag
/ip firewall address-list add list=$tmpList address="122.72.23.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="122.72.62.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="122.83.0.0/16" comment=$tag
/ip firewall address-list add list=$tmpList address="122.92.0.0/17" comment=$tag
/ip firewall address-list add list=$tmpList address="122.92.128.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="122.92.192.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="122.92.208.0/21" comment=$tag
/ip firewall address-list add list=$tmpList address="122.92.216.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="122.92.218.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="123.196.69.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="123.196.70.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="123.196.72.0/21" comment=$tag
/ip firewall address-list add list=$tmpList address="123.196.80.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="123.196.84.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="124.14.160.0/19" comment=$tag
/ip firewall address-list add list=$tmpList address="124.73.0.0/16" comment=$tag
/ip firewall address-list add list=$tmpList address="124.112.0.0/15" comment=$tag
/ip firewall address-list add list=$tmpList address="128.108.136.0/21" comment=$tag
/ip firewall address-list add list=$tmpList address="128.108.144.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="128.108.160.0/21" comment=$tag
/ip firewall address-list add list=$tmpList address="144.48.64.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="180.89.160.0/19" comment=$tag
/ip firewall address-list add list=$tmpList address="180.89.192.0/19" comment=$tag
/ip firewall address-list add list=$tmpList address="180.210.212.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="180.210.214.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="183.160.0.0/13" comment=$tag
/ip firewall address-list add list=$tmpList address="202.38.64.0/19" comment=$tag
/ip firewall address-list add list=$tmpList address="202.38.107.32/29" comment=$tag
/ip firewall address-list add list=$tmpList address="202.38.140.112/29" comment=$tag
/ip firewall address-list add list=$tmpList address="202.102.192.0/19" comment=$tag
/ip firewall address-list add list=$tmpList address="202.111.192.0/19" comment=$tag
/ip firewall address-list add list=$tmpList address="202.127.200.0/21" comment=$tag
/ip firewall address-list add list=$tmpList address="202.141.160.0/19" comment=$tag
/ip firewall address-list add list=$tmpList address="203.93.240.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="203.114.80.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="210.45.0.0/16" comment=$tag
/ip firewall address-list add list=$tmpList address="210.52.248.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="210.52.250.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="210.52.253.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="210.52.254.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="210.72.22.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="210.73.16.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="211.70.40.0/21" comment=$tag
/ip firewall address-list add list=$tmpList address="211.70.48.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="211.70.128.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="211.86.128.0/17" comment=$tag
/ip firewall address-list add list=$tmpList address="211.91.64.0/19" comment=$tag
/ip firewall address-list add list=$tmpList address="211.91.96.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="211.98.170.32/28" comment=$tag
/ip firewall address-list add list=$tmpList address="211.138.176.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="211.141.160.0/19" comment=$tag
/ip firewall address-list add list=$tmpList address="211.141.192.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="211.162.0.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="218.22.0.0/15" comment=$tag
/ip firewall address-list add list=$tmpList address="218.104.64.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="218.106.80.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="218.185.192.0/19" comment=$tag
/ip firewall address-list add list=$tmpList address="219.231.0.0/17" comment=$tag
/ip firewall address-list add list=$tmpList address="219.243.247.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="220.114.128.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="220.115.128.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="220.178.0.0/15" comment=$tag
/ip firewall address-list add list=$tmpList address="220.180.0.0/16" comment=$tag
/ip firewall address-list add list=$tmpList address="220.195.128.0/17" comment=$tag
/ip firewall address-list add list=$tmpList address="220.205.0.0/19" comment=$tag
/ip firewall address-list add list=$tmpList address="220.205.32.0/21" comment=$tag
/ip firewall address-list add list=$tmpList address="220.205.64.0/19" comment=$tag
/ip firewall address-list add list=$tmpList address="220.205.120.0/21" comment=$tag
/ip firewall address-list add list=$tmpList address="220.205.128.0/17" comment=$tag
/ip firewall address-list add list=$tmpList address="220.248.224.0/19" comment=$tag
/ip firewall address-list add list=$tmpList address="221.130.112.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="221.130.128.0/19" comment=$tag
/ip firewall address-list add list=$tmpList address="221.130.160.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="222.48.0.0/16" comment=$tag
/ip firewall address-list add list=$tmpList address="222.195.0.0/17" comment=$tag
/ip firewall address-list add list=$tmpList address="222.207.0.0/17" comment=$tag
/ip firewall address-list add list=$tmpList address="223.104.18.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="223.104.33.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="223.104.34.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="223.104.36.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="223.160.168.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="223.161.228.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="223.210.49.192/27" comment=$tag
/ip firewall address-list add list=$tmpList address="223.214.0.0/15" comment=$tag
/ip firewall address-list add list=$tmpList address="223.240.0.0/13" comment=$tag

# 将旧的 github-feed 管理条目移动到 old list
:foreach i in=[/ip firewall address-list find list=$listName] do={
    :local c [:tostr [/ip firewall address-list get $i comment]]
    :local p [:find $c $tagPrefix]
    :if ([:typeof $p] != "nil") do={
        :if ($p = 0) do={
            /ip firewall address-list set $i list=$oldList
        }
    }
}

# 将新条目从 tmp list 移动到正式 list
:foreach i in=[/ip firewall address-list find list=$tmpList comment=$tag] do={
    /ip firewall address-list set $i list=$listName
}

# 校验新条目数量
:local finalCount [:len [/ip firewall address-list find list=$listName comment=$tag]]
:if ($finalCount != $newCount) do={
    :error ("Address-List: " . $listName . " 更新失败，数量不一致，expected=" . $newCount . ", actual=" . $finalCount)
}

# 删除旧的 github-feed 条目
:foreach i in=[/ip firewall address-list find list=$oldList] do={
    /ip firewall address-list remove $i
}

# 清理 tmp 残留
:foreach i in=[/ip firewall address-list find list=$tmpList] do={
    /ip firewall address-list remove $i
}

:log warning ("Address-List: " . $listName . " 更新完成，共 " . $newCount . " 条")

