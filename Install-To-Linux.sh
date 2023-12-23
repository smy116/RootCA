#!/bin/bash

# 确保脚本以root权限运行
if [ "$(id -u)" != "0" ]; then
   echo "该脚本必须以root权限运行" 1>&2
   exit 1
fi

echo "即将向系统证书库添加SMY Root Certification Authority" 1>&2

read -p "按任意键继续..." -n1 -s
echo

# SMY Root Certification Authority RSA
read -r -d '' RSA_Content << 'EOF'
-----BEGIN CERTIFICATE-----
MIIFlzCCA3+gAwIBAgIUA5evVoiTWB6AVr6kPiNaNNWRKk4wDQYJKoZIhvcNAQEM
BQAwWjELMAkGA1UEBhMCQ04xDjAMBgNVBAgMBUh1bmFuMQwwCgYDVQQKDANTTVkx
LTArBgNVBAMMJFNNWSBSb290IENlcnRpZmljYXRpb24gQXV0aG9yaXR5IFJTQTAg
Fw0yMzEyMjEwNzQ2MjZaGA8yMTIyMTEyNzA3NDYyNlowWjELMAkGA1UEBhMCQ04x
DjAMBgNVBAgMBUh1bmFuMQwwCgYDVQQKDANTTVkxLTArBgNVBAMMJFNNWSBSb290
IENlcnRpZmljYXRpb24gQXV0aG9yaXR5IFJTQTCCAiIwDQYJKoZIhvcNAQEBBQAD
ggIPADCCAgoCggIBANCu0QmEB2QR7thB5nDmpPYj/bjhk9OlJhKyAGSdddH94eFT
iNbBthofJeaaqw4HPNu5lLGZ3OKctuh4eAqu4RAdD/QJ5Vxx355t67W83K71sJUr
A/VtYsjXQxjnZuU5Vo42R1pwvLzLSv43am+EKabm3eetvRkwbV/+s5EwEfZbisfa
ss3hrK8uad2Ar7PH2GLoPjU0FKqPNqnoxLrPGJKrPnBDM2njqdEI8YZPMkb0MlTB
8aDUVNfjrc2FGu/dgqN8Fbrp88SjRZDEth2NUDz2wc4QZtliHbpZpnGr4TmTpUSy
2wuPAXUODwW6bOj3o+WgioqVCGECGvEIHQ39iXwmvlHBXwcPOBHqPkLnVB5EP7cN
LIypyRQdtRuQTt6yztsvcKh5c1QJN2I7q8wZMPjXVD8tMqRnEMTthepfGq3kKKQq
vONHHGWU92Bo2hva8Oh6LmXaMwvkmm47byG2+j57iVVcM6+2E45DVQBh8bbC8PKc
vBnut6aopi2xAZFawPvURTl4BA0LezcqxDkwnueButnsrDT+uvJjuh/sOjLGw9CN
ldMozGFjtpQEgwy6iuHd3nUd7xk1EZ/sXpAaoswlea2sd7VLo/b4JWMZgoHcMhKf
t+J0BOYTYes/u1g+p9GkpXYKYIU3WZlyCQfFi/7s83jT2bwhWzcwmeIg5gT1AgMB
AAGjUzBRMB0GA1UdDgQWBBS2l2d3MKZf1SMMd5cjmL2Hg0O6XjAfBgNVHSMEGDAW
gBS2l2d3MKZf1SMMd5cjmL2Hg0O6XjAPBgNVHRMBAf8EBTADAQH/MA0GCSqGSIb3
DQEBDAUAA4ICAQCFxAQZrp5VEumur/iFoexTPyIdln8gGsggqqEaQ8jtD6Rzt5NK
VJamsjM+u3ktKQq8xWDRvt86Ln4/fcGVGCtZvTbU+S8qrc/5LDz/XxsLazpNByFV
YpxCiDCKjlc6ZV6LPHMmFBtDEh15QVhtZjTHzy34xb/t366ML72YQqS9seG3iE96
rwtQ7D4uvez3NQqaWGr6plif1D5CuiIkyxTY+3V9onKbpakVcmbT8ivDpsJfdZ2t
e5LoW79s5lba68YyilptCwMGBMrUwA96Ng8KxbB7MLOL2pILkUJukX3onOdpE0cr
ySKLXpC9X8EDjefJhQog8nOfF9BURaKS+wzxxv17TOQvWIkGr76duQWqTjT+0JTU
h3lUs9DxCeA+ee0kg+ODLHDarO5v47AQVuP41W1x+sz7uuJl6gqUJkA9r5lvhj/a
G66CA5Wl4VQFscbhyykkeO/A78IKawMqmDapjcQJCqLAwrsr7S8pC/GaIxw3XbH1
1WUGbgdIihN2fCQnuItKHxxdvAR/cWMla+hr8h5t8KgM08s31JW/P2Q9NpxGYRNV
TK8BqrTlcH9JU6ik8SSOz+PkO3y66KstzyWf9ss8uWly9f8gHzCFqBLE9FvWEzD7
+9JWMoCXX05w2Mb7eW4YIaQ4ihtTPpmhJFQ3BqGC9t2l1GmLXFFc7P9d0Q==
-----END CERTIFICATE-----
EOF


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
        echo "$RSA_Content" > "/usr/local/share/ca-certificates/SMY-Root-CA-RSA.crt"
        echo "$ECC_Content" > "/usr/local/share/ca-certificates/SMY-Root-CA-ECC.crt"
        update-ca-certificates
        ;;
    centos|fedora|rhel)
        # 对于CentOS, Fedora, RHEL系统
        echo "$RSA_Content" > "/etc/pki/ca-trust/source/anchors/SMY-Root-CA-RSA.crt"
        echo "$ECC_Content" > "/etc/pki/ca-trust/source/anchors/SMY-Root-CA-ECC.crt"
        update-ca-trust extract
        ;;
    openwrt)
        # 对于OpenWrt系统
        echo "$RSA_Content" > "/etc/ssl/certs/SMY-Root-CA-RSA.crt"
        echo "$ECC_Content" > "/etc/ssl/certs/SMY-Root-CA-ECC.crt"
        ;;
    *)
        echo "不支持的Linux发行版: $OS"
        exit 1
        ;;
esac

echo "证书已导入并更新。"
