#!/bin/bash

# 确保脚本以root权限运行
if [ "$(id -u)" != "0" ]; then
   echo "该脚本必须以root权限运行" 1>&2
   exit 1
fi

echo "即将向系统证书库添加SMY Root Certification Authority" 1>&2

read -p "按任意键继续..." -n1 -s
echo

# SMY Root Certification Authority ECC
read -r -d '' ECC_Content << 'EOF'
-----BEGIN CERTIFICATE-----
MIICSDCCAc6gAwIBAgIUM4jeRFYbyv7wkCJ9C+j8hHpGECEwCgYIKoZIzj0EAwMw
WjELMAkGA1UEBhMCQ04xDjAMBgNVBAgMBUh1bmFuMQwwCgYDVQQKDANTTVkxLTAr
BgNVBAMMJFNNWSBSb290IENlcnRpZmljYXRpb24gQXV0aG9yaXR5IEVDQzAgFw0y
MzEyMjEwNzUyNDVaGA8yMTIyMTEyNzA3NTI0NVowWjELMAkGA1UEBhMCQ04xDjAM
BgNVBAgMBUh1bmFuMQwwCgYDVQQKDANTTVkxLTArBgNVBAMMJFNNWSBSb290IENl
cnRpZmljYXRpb24gQXV0aG9yaXR5IEVDQzB2MBAGByqGSM49AgEGBSuBBAAiA2IA
BBvH4Xa36MTKrnhBIyyUg/IxykVOwZhzVXzYPswPGOYYE9enmuqmdaN6lhXzduBT
5arxSCULpsrZ8lb/wxO6cEkJCa5E1acfgVRdno6JfdBxZd7WEw8J94mrbqw5mxPr
Q6NTMFEwHQYDVR0OBBYEFD5c06VwJKNCtzLpVCcd6HS8RtrKMB8GA1UdIwQYMBaA
FD5c06VwJKNCtzLpVCcd6HS8RtrKMA8GA1UdEwEB/wQFMAMBAf8wCgYIKoZIzj0E
AwMDaAAwZQIwWOC+QllECy76guWZNdQSDXO5sSUlo1JBwQVTbwDrtF2ABB7ptjgh
9/ILrkbq7rM5AjEA7pXuwkLz/hZUQM/RtNAsMkzbxqBUOwrxV9LJ0sWF4uQjxMu8
aSsoBsICQmAdfnx+
-----END CERTIFICATE-----
EOF


# 检测Linux发行版
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
elif [ -f /etc/openwrt_release ]; then
    OS="openwrt"
else
    echo "不能确定Linux发行版"
    exit 1
fi

# 根据不同的发行版，执行不同的命令导入证书
case $OS in
    ubuntu|debian)
        # 对于Ubuntu和Debian系统
        echo "$ECC_Content" > "/usr/local/share/ca-certificates/SMY-Root-CA.crt"
        update-ca-certificates
        ;;
    centos|fedora|rhel)
        # 对于CentOS, Fedora, RHEL系统
        echo "$ECC_Content" > "/etc/pki/ca-trust/source/anchors/SMY-Root-CA.crt"
        update-ca-trust extract
        ;;
    openwrt)
        # 对于OpenWrt系统
        echo "$ECC_Content" > "/etc/ssl/certs/SMY-Root-CA.crt"
        ;;
    *)
        echo "不支持的Linux发行版: $OS"
        exit 1
        ;;
esac

echo "证书已导入并更新。"
