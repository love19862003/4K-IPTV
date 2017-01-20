#!/bin/sh

#文本提示
echo 欢迎使用本脚本
ping 127.0.0.1 -c 2 > /dev/null
echo 本脚本只适用于merlin改版固件，其他固件请勿运行本脚本
ping 127.0.0.1 -c 2 > /dev/null
echo 以及仅支持7.0及以下固件，7.1及以上由于目录改变不支持本脚本
ping 127.0.0.1 -c 2 > /dev/null
echo 本提示保留5秒，如果您不是merlin改版固件请立刻按下Ctrl+C中止本脚本
ping 127.0.0.1 -c 10 > /dev/null
echo 本脚本适用于上海电信需要AB面认证的IPTV，其他地区请按实际情况修改脚本
ping 127.0.0.1 -c 2 > /dev/null
echo 使用前请确认光猫已经设置桥接
ping 127.0.0.1 -c 2 > /dev/null
echo 请确认ss是工作状态或者是关闭状态，否则会导致脚本运行失败
ping 127.0.0.1 -c 2 > /dev/null

#空行
echo

#开始提示
echo 正在增加开机自动重启dnsmasq
#移动到脚本目录
cd /jffs/scripts
#删除之前的脚本
echo 正在删除旧文件
rm -rf wan-start*
#下载开机运行脚本
echo 正在下载新文件
wget -q --no-check-certificate https://raw.githubusercontent.com/ArronYin/4K-IPTV/master/wan-start
#设置权限
chmod -R 0755 wan-start
#完成提示
echo 成功

#延迟运行
ping 127.0.0.1 -c 2 > /dev/null
#空行
echo

#脚本提示
echo 正在修改ss dnsmasq配置文件
#移动到ss dnsmasq目录
cd /jffs/ss/rules
#删除旧配置文件
echo 正在删除旧文件
rm -rf dnsmasq.postconf
#下载新配置文件
echo 正在下载新文件
wget -q --no-check-certificate https://raw.githubusercontent.com/ArronYin/4K-IPTV/master/dnsmasq.conf
#重命名新配置文件
mv dnsmasq.conf dnsmasq.postconf
#设置权限
chmod -R 0755 dnsmasq.postconf
#完成提示
echo 成功

#延迟运行
ping 127.0.0.1 -c 2 > /dev/null
#空行
echo

#脚本提示
echo 正在修改不开启ss情况下的配置文件
#移动到脚本目录
cd /jffs/scripts
#删除旧dnsmasq配置文件
echo 正在删除旧文件
rm -rf dnsmasq.postconf
#下载新配置文件
echo 正在下载新文件
wget -q --no-check-certificate https://raw.githubusercontent.com/ArronYin/4K-IPTV/master/dnsmasq.conf
#重命名新配置文件
mv dnsmasq.conf dnsmasq.postconf
#设置权限
chmod -R 0755 dnsmasq.postconf
#完成提示
echo 成功

#延迟运行
ping 127.0.0.1 -c 2 > /dev/null
#空行
echo

#运行提示
echo 正在重启dnsmasq
#重启dnsmasq
service restart_dnsmasq > /dev/null
#完成提示
echo dnsmasq已重启

#延迟运行
ping 127.0.0.1 -c 2 > /dev/null
#空行
echo

#返回默认目录
cd

#提示成功
ping 127.0.0.1 -c 2 > /dev/null
echo 脚本运行完成，如果光猫已经设置完毕，您可以把IPTV接在Lan1-4任意接口
ping 127.0.0.1 -c 2 > /dev/null
