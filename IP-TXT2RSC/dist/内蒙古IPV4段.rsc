# ==================================================
# Auto generated RouterOS address-list update script
# List: 内蒙古IPV4段
# Family: ipv4
# Source: https://metowolf.github.io/iplist/data/cncity/150000.txt
# Entries: 368
# Tag: github-feed:内蒙古IPV4段:20260615221756
# Generated at UTC: 2026-06-15T22:17:56.788279Z
# ==================================================

:local listName "内蒙古IPV4段"
:local tmpList "内蒙古IPV4段__tmp"
:local oldList "内蒙古IPV4段__old"
:local tag "github-feed:内蒙古IPV4段:20260615221756"
:local tagPrefix "github-feed:内蒙古IPV4段:"
:local newCount 368

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
/ip firewall address-list add list=$tmpList address="1.24.0.0/13" comment=$tag
/ip firewall address-list add list=$tmpList address="1.92.192.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="1.180.0.0/14" comment=$tag
/ip firewall address-list add list=$tmpList address="8.130.8.0/21" comment=$tag
/ip firewall address-list add list=$tmpList address="8.130.16.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="8.130.32.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="8.130.48.0/21" comment=$tag
/ip firewall address-list add list=$tmpList address="8.130.64.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="8.130.128.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="8.130.208.0/21" comment=$tag
/ip firewall address-list add list=$tmpList address="8.141.191.64/27" comment=$tag
/ip firewall address-list add list=$tmpList address="8.141.244.160/29" comment=$tag
/ip firewall address-list add list=$tmpList address="8.143.0.0/21" comment=$tag
/ip firewall address-list add list=$tmpList address="8.143.8.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="8.143.13.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="8.143.14.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="8.143.17.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="8.143.18.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="8.143.20.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="8.143.22.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="8.143.25.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="8.143.26.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="8.143.28.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="8.143.49.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="8.143.143.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="8.143.159.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="8.143.191.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="8.143.192.64/29" comment=$tag
/ip firewall address-list add list=$tmpList address="8.143.196.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="8.143.200.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="8.143.248.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="8.152.140.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="8.160.226.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="8.160.245.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="8.161.7.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="36.102.0.0/16" comment=$tag
/ip firewall address-list add list=$tmpList address="36.111.128.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="36.111.144.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="36.111.152.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="36.134.88.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="36.134.92.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="36.137.78.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="36.137.80.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="36.137.90.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="36.137.126.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="36.137.154.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="36.137.208.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="36.138.52.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="36.138.156.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="36.138.160.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="36.139.176.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="36.140.63.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="36.140.229.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="36.140.230.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="36.140.233.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="36.140.234.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="36.140.253.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="36.192.36.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="36.192.40.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="36.212.72.0/21" comment=$tag
/ip firewall address-list add list=$tmpList address="36.212.80.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="39.99.32.0/19" comment=$tag
/ip firewall address-list add list=$tmpList address="39.101.64.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="39.104.0.0/19" comment=$tag
/ip firewall address-list add list=$tmpList address="39.104.48.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="39.104.64.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="39.104.128.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="39.104.200.0/21" comment=$tag
/ip firewall address-list add list=$tmpList address="39.134.168.0/21" comment=$tag
/ip firewall address-list add list=$tmpList address="39.137.88.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="39.137.92.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="39.144.92.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="39.144.94.128/28" comment=$tag
/ip firewall address-list add list=$tmpList address="39.153.128.0/17" comment=$tag
/ip firewall address-list add list=$tmpList address="39.154.0.0/16" comment=$tag
/ip firewall address-list add list=$tmpList address="39.155.0.0/17" comment=$tag
/ip firewall address-list add list=$tmpList address="42.123.64.0/19" comment=$tag
/ip firewall address-list add list=$tmpList address="42.187.120.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.5.176/29" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.16.0/27" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.16.32/28" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.24.80/28" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.27.160/27" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.27.192/28" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.44.160/27" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.45.192/27" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.47.48/28" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.47.64/27" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.51.0/27" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.59.48/28" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.59.192/27" comment=$tag
/ip firewall address-list add list=$tmpList address="42.247.60.128/28" comment=$tag
/ip firewall address-list add list=$tmpList address="43.226.116.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="43.240.220.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="43.243.228.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="43.251.244.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="43.254.8.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="43.254.168.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="45.115.200.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="45.116.152.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="45.119.116.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="45.125.56.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="58.18.0.0/16" comment=$tag
/ip firewall address-list add list=$tmpList address="58.195.83.64/28" comment=$tag
/ip firewall address-list add list=$tmpList address="58.195.89.208/28" comment=$tag
/ip firewall address-list add list=$tmpList address="58.195.97.224/28" comment=$tag
/ip firewall address-list add list=$tmpList address="58.195.100.96/28" comment=$tag
/ip firewall address-list add list=$tmpList address="58.200.19.0/25" comment=$tag
/ip firewall address-list add list=$tmpList address="59.81.40.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="59.82.17.96/27" comment=$tag
/ip firewall address-list add list=$tmpList address="59.82.18.0/26" comment=$tag
/ip firewall address-list add list=$tmpList address="59.82.19.128/25" comment=$tag
/ip firewall address-list add list=$tmpList address="59.82.30.0/28" comment=$tag
/ip firewall address-list add list=$tmpList address="59.82.30.20/30" comment=$tag
/ip firewall address-list add list=$tmpList address="59.82.30.24/29" comment=$tag
/ip firewall address-list add list=$tmpList address="59.82.30.32/27" comment=$tag
/ip firewall address-list add list=$tmpList address="59.82.30.64/26" comment=$tag
/ip firewall address-list add list=$tmpList address="59.82.30.128/26" comment=$tag
/ip firewall address-list add list=$tmpList address="59.82.56.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="59.82.58.0/26" comment=$tag
/ip firewall address-list add list=$tmpList address="59.82.60.64/26" comment=$tag
/ip firewall address-list add list=$tmpList address="59.82.60.160/27" comment=$tag
/ip firewall address-list add list=$tmpList address="59.82.60.192/29" comment=$tag
/ip firewall address-list add list=$tmpList address="59.82.60.212/30" comment=$tag
/ip firewall address-list add list=$tmpList address="59.82.60.216/29" comment=$tag
/ip firewall address-list add list=$tmpList address="59.82.60.224/27" comment=$tag
/ip firewall address-list add list=$tmpList address="59.82.94.160/30" comment=$tag
/ip firewall address-list add list=$tmpList address="59.82.144.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="60.31.0.0/16" comment=$tag
/ip firewall address-list add list=$tmpList address="61.134.96.0/19" comment=$tag
/ip firewall address-list add list=$tmpList address="61.138.64.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="61.232.58.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="61.232.60.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="61.233.48.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="61.240.160.0/19" comment=$tag
/ip firewall address-list add list=$tmpList address="101.1.0.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="101.2.172.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="101.7.0.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="101.50.56.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="101.53.100.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="101.78.0.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="101.110.116.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="101.128.0.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="101.203.172.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="101.234.76.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="101.251.0.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="103.3.140.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="103.22.8.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="103.36.220.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="103.45.96.0/19" comment=$tag
/ip firewall address-list add list=$tmpList address="103.55.228.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="103.59.164.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="103.72.120.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="103.114.68.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="103.163.46.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="103.193.188.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="103.193.192.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="103.212.4.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="103.215.28.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="103.224.232.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="103.230.200.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="103.238.88.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="103.241.94.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="103.243.136.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="106.11.41.64/27" comment=$tag
/ip firewall address-list add list=$tmpList address="106.11.44.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="106.35.0.0/16" comment=$tag
/ip firewall address-list add list=$tmpList address="106.40.0.0/16" comment=$tag
/ip firewall address-list add list=$tmpList address="106.74.0.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="106.74.64.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="106.74.82.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="106.74.84.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="106.74.88.0/21" comment=$tag
/ip firewall address-list add list=$tmpList address="106.74.99.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="106.74.100.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="106.74.104.0/21" comment=$tag
/ip firewall address-list add list=$tmpList address="106.74.112.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="106.74.128.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="106.74.192.0/21" comment=$tag
/ip firewall address-list add list=$tmpList address="106.74.200.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="106.74.208.0/21" comment=$tag
/ip firewall address-list add list=$tmpList address="106.74.228.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="106.74.232.0/21" comment=$tag
/ip firewall address-list add list=$tmpList address="106.74.240.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="106.74.242.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="106.74.244.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="106.74.249.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="106.74.250.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="106.74.252.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="106.125.0.0/16" comment=$tag
/ip firewall address-list add list=$tmpList address="110.6.0.0/15" comment=$tag
/ip firewall address-list add list=$tmpList address="110.16.0.0/14" comment=$tag
/ip firewall address-list add list=$tmpList address="110.76.156.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="110.76.184.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="110.102.0.0/16" comment=$tag
/ip firewall address-list add list=$tmpList address="111.54.3.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="111.54.4.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="111.54.137.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="111.54.138.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="111.54.142.128/25" comment=$tag
/ip firewall address-list add list=$tmpList address="111.54.144.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="111.56.0.0/15" comment=$tag
/ip firewall address-list add list=$tmpList address="111.126.0.0/15" comment=$tag
/ip firewall address-list add list=$tmpList address="111.235.156.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="113.44.96.0/19" comment=$tag
/ip firewall address-list add list=$tmpList address="113.46.0.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="113.47.236.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="113.47.252.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="115.24.64.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="115.26.128.0/17" comment=$tag
/ip firewall address-list add list=$tmpList address="115.31.72.0/21" comment=$tag
/ip firewall address-list add list=$tmpList address="115.32.56.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="115.168.36.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="115.168.68.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="116.95.0.0/16" comment=$tag
/ip firewall address-list add list=$tmpList address="116.112.0.0/14" comment=$tag
/ip firewall address-list add list=$tmpList address="116.116.0.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="116.116.64.0/21" comment=$tag
/ip firewall address-list add list=$tmpList address="116.116.72.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="116.116.74.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="116.116.76.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="116.116.80.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="116.116.96.0/19" comment=$tag
/ip firewall address-list add list=$tmpList address="116.116.128.0/17" comment=$tag
/ip firewall address-list add list=$tmpList address="116.117.0.0/16" comment=$tag
/ip firewall address-list add list=$tmpList address="116.135.64.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="116.135.128.0/17" comment=$tag
/ip firewall address-list add list=$tmpList address="116.136.0.0/16" comment=$tag
/ip firewall address-list add list=$tmpList address="116.204.0.0/17" comment=$tag
/ip firewall address-list add list=$tmpList address="116.204.132.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="116.204.156.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="116.204.159.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="116.204.170.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="116.204.176.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="116.204.184.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="116.204.187.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="116.205.40.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="116.205.42.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="116.205.44.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="117.49.35.0/31" comment=$tag
/ip firewall address-list add list=$tmpList address="117.49.35.4/30" comment=$tag
/ip firewall address-list add list=$tmpList address="117.49.35.8/30" comment=$tag
/ip firewall address-list add list=$tmpList address="117.49.35.12/31" comment=$tag
/ip firewall address-list add list=$tmpList address="117.49.35.16/30" comment=$tag
/ip firewall address-list add list=$tmpList address="117.49.35.20/31" comment=$tag
/ip firewall address-list add list=$tmpList address="117.49.35.24/30" comment=$tag
/ip firewall address-list add list=$tmpList address="117.124.243.128/27" comment=$tag
/ip firewall address-list add list=$tmpList address="117.132.184.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="117.132.188.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="117.132.199.64/26" comment=$tag
/ip firewall address-list add list=$tmpList address="117.132.199.128/25" comment=$tag
/ip firewall address-list add list=$tmpList address="117.132.200.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="117.136.3.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="117.137.0.0/16" comment=$tag
/ip firewall address-list add list=$tmpList address="117.138.0.0/16" comment=$tag
/ip firewall address-list add list=$tmpList address="117.161.0.0/16" comment=$tag
/ip firewall address-list add list=$tmpList address="118.230.0.0/17" comment=$tag
/ip firewall address-list add list=$tmpList address="120.193.128.0/17" comment=$tag
/ip firewall address-list add list=$tmpList address="121.37.64.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="121.56.0.0/15" comment=$tag
/ip firewall address-list add list=$tmpList address="121.193.0.0/17" comment=$tag
/ip firewall address-list add list=$tmpList address="122.72.19.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="122.72.44.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="122.76.0.0/16" comment=$tag
/ip firewall address-list add list=$tmpList address="123.178.0.0/15" comment=$tag
/ip firewall address-list add list=$tmpList address="124.67.0.0/16" comment=$tag
/ip firewall address-list add list=$tmpList address="144.48.12.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="146.196.116.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="150.223.0.0/16" comment=$tag
/ip firewall address-list add list=$tmpList address="182.42.0.0/16" comment=$tag
/ip firewall address-list add list=$tmpList address="183.175.0.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="202.38.106.32/29" comment=$tag
/ip firewall address-list add list=$tmpList address="202.99.224.0/19" comment=$tag
/ip firewall address-list add list=$tmpList address="202.164.0.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="202.207.0.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="202.207.64.0/19" comment=$tag
/ip firewall address-list add list=$tmpList address="202.207.96.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="202.207.112.0/21" comment=$tag
/ip firewall address-list add list=$tmpList address="202.207.144.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="203.33.32.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="203.33.64.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="203.56.4.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="203.56.24.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="203.56.38.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="203.56.40.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="203.56.46.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="203.56.95.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="203.56.210.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="203.56.214.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="203.56.228.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="203.56.232.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="203.56.240.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="203.56.252.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="203.56.254.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="203.57.5.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="203.57.6.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="203.57.28.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="203.57.39.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="203.57.46.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="203.57.58.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="203.57.101.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="203.57.109.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="203.57.123.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="203.57.157.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="203.57.200.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="203.57.202.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="203.57.206.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="203.57.222.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="203.57.249.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="203.78.48.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="203.80.32.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="203.119.253.192/26" comment=$tag
/ip firewall address-list add list=$tmpList address="203.174.4.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="203.176.64.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="203.176.80.0/21" comment=$tag
/ip firewall address-list add list=$tmpList address="203.176.88.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="203.205.64.0/19" comment=$tag
/ip firewall address-list add list=$tmpList address="210.31.176.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="211.82.128.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="211.90.72.0/21" comment=$tag
/ip firewall address-list add list=$tmpList address="211.93.152.0/21" comment=$tag
/ip firewall address-list add list=$tmpList address="211.93.160.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="211.98.25.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="211.98.31.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="211.98.128.0/29" comment=$tag
/ip firewall address-list add list=$tmpList address="211.98.151.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="211.98.152.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="211.98.171.16/29" comment=$tag
/ip firewall address-list add list=$tmpList address="211.98.224.152/29" comment=$tag
/ip firewall address-list add list=$tmpList address="211.98.238.0/26" comment=$tag
/ip firewall address-list add list=$tmpList address="211.98.239.136/29" comment=$tag
/ip firewall address-list add list=$tmpList address="211.98.239.144/30" comment=$tag
/ip firewall address-list add list=$tmpList address="211.98.241.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="211.101.232.0/21" comment=$tag
/ip firewall address-list add list=$tmpList address="211.101.244.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="211.138.80.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="218.21.128.0/17" comment=$tag
/ip firewall address-list add list=$tmpList address="218.30.178.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="218.202.64.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="218.202.128.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="218.207.224.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="219.147.96.0/19" comment=$tag
/ip firewall address-list add list=$tmpList address="219.148.160.0/19" comment=$tag
/ip firewall address-list add list=$tmpList address="219.159.0.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="219.225.122.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="219.225.128.0/17" comment=$tag
/ip firewall address-list add list=$tmpList address="219.243.228.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="220.195.0.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="220.195.64.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="220.195.80.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="221.199.128.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="221.199.192.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="222.31.192.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="222.39.0.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="222.39.64.0/19" comment=$tag
/ip firewall address-list add list=$tmpList address="222.39.96.0/20" comment=$tag
/ip firewall address-list add list=$tmpList address="222.39.112.0/21" comment=$tag
/ip firewall address-list add list=$tmpList address="222.39.120.0/22" comment=$tag
/ip firewall address-list add list=$tmpList address="222.39.124.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="222.39.126.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="222.39.128.0/17" comment=$tag
/ip firewall address-list add list=$tmpList address="222.74.0.0/16" comment=$tag
/ip firewall address-list add list=$tmpList address="222.199.64.0/18" comment=$tag
/ip firewall address-list add list=$tmpList address="223.104.15.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="223.104.178.0/24" comment=$tag
/ip firewall address-list add list=$tmpList address="223.160.142.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="223.161.206.0/23" comment=$tag
/ip firewall address-list add list=$tmpList address="223.255.252.0/24" comment=$tag

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

