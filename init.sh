#!/bin/bash

export LC_ALL=C
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

osRelease=""
isChina=0

publicKey="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCaK2pVOdTT8POACgWPJ52adBHmtgx462N/Fn22r7srjYJrvPZH+zOofEbvAUTurjXAL4RD+Lc78cZRCm+CYifpweA9gmS0UTo5PaFLTGruOCzMZHfpGDnSqw5CHMS00xQx1Yozq5e+x6cNxtM0ZdQYy0x1pkhdI+W+mZIUCMaM07469At2YNqxcIcTwIXZgAR2Bd9WiogDHvVoDo1yoQBIXNN+dpA23BJQGE+hNbnasUACI6SfN6HWok2rdyQAXvzuVa7QWjhjqT0HmST8l4f4vJ6DnCKP/yZSjoO0vc72IyHduLk9qVhjhsOehLoi7AXdsX5Ab7HggTZ00Uln+ZBz root@iZ2894t29fxZ"


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


if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "This script must be run as root" 
    exit 1
fi

function  start_menu(){
    clear

    green " ================================================================="
    green " SMY 环境一键部署脚本 | 系统支持：Centos / Debian / Ubuntu / Openwrt"
    green " ================================================================="
    green " 当前系统类型：$osRelease"
    echo
    green " 1. 设置北京时区"
    green " 2. 配置SSH及Root账户"
    green " 3. 安装 SMY Root Certification Authority"
    green " 4. 运行哪吒监控 Agent 安装脚本"
    green " 5. 运行Linux内核 BBR Cloudflare WARP安装脚本"
    green " 6. 从Nginx源安装 Nginx Stable version"
    green " 7. 运行ACME Shell script: acme.sh"
    green " 9. 重启系统"
    green " 0. 退出脚本"

    echo
    read -p "Please input number:" menuNumberInput
    case "$menuNumberInput" in

        1 )
        #1. 设置北京时区
            echo "设置北京时区........"
            setLinuxDateZone

            read -p "是否返回主菜单? 直接回车默认返回主菜单, 请输入[Y/n]:" isContinueInput
            isContinueInput=${isContinueInput:-Y}

            if [[ $isContinueInput == [Yy] ]]; then
                start_menu
            else 
                exit 0
            fi
            
        ;;

        2 )
        #2. 配置SSH及Root账户 
            echo "设置SSH root 登录........"
            yellow "请输入新的root账户密码"
            passwd root
            green "修改root密码为成功！"
            echo "写入SSH公钥........"
            setPublicKey
            green "设置成功, 请用SSH工具软件登陆服务器!"
            
            read -p "是否返回主菜单? 直接回车默认返回主菜单, 请输入[Y/n]:" isContinueInput
            isContinueInput=${isContinueInput:-Y}

            if [[ $isContinueInput == [Yy] ]]; then
                start_menu
            else 
                exit 0
            fi

        ;;

        3 )
        #3. 安装 SMY Root Certification Authority
            installCA
            read -p "是否返回主菜单? 直接回车默认返回主菜单, 请输入[Y/n]:" isContinueInput
            isContinueInput=${isContinueInput:-Y}

            if [[ $isContinueInput == [Yy] ]]; then
                start_menu
            else 
                exit 0
            fi
        ;;

        4 )
            #4. 运行哪吒监控 Agent 安装脚本
            
            read -p "输入哪吒监控 Agent 密钥:" nezhaAgentKey
            if [[ $nezhaAgentKey == "" ]]; then
                yellow "密钥为空！"
                sleep 2s
                start_menu
            fi
            getServerLocal
            if [ $isChina -eq 1 ]; then
                curl -L https://gitee.com/naibahq/nezha/raw/master/script/install.sh -o nezha.sh && chmod +x nezha.sh && sudo CN=true ./nezha.sh install_agent status-api.smy.me 443 $nezhaAgentKey --tls --disable-command-execute
            else
                curl -L https://raw.githubusercontent.com/naiba/nezha/master/script/install.sh -o nezha.sh && chmod +x nezha.sh && sudo CN=true ./nezha.sh install_agent status-api.smy.me 443 $nezhaAgentKey --tls --disable-command-execute
            fi
            

        ;;

        5 )
            getServerLocal
            if [ $isChina -eq 1 ]; then
                curl -O https://cdn.jsdelivr.net/gh/jinwyp/one_click_script@master/install_kernel.sh && chmod +x ./install_kernel.sh && ./install_kernel.sh
            else
                curl -O https://raw.githubusercontent.com/jinwyp/one_click_script/master/install_kernel.sh && chmod +x ./install_kernel.sh && ./install_kernel.sh
            fi
            
        ;;

        6 )
            
            # 根据不同的发行版，选择不同的安装方式
            case $osRelease in
                ubuntu)
                    # 对于Ubuntu系统
                    install_nginx_ubuntu
                    # Start and enable Nginx service
                    echo "Starting Nginx..."
                    sudo systemctl start nginx
                    sudo systemctl enable nginx
                    ;;
                debian)
                    # 对于Debian系统
                    install_nginx_debian
                    # Start and enable Nginx service
                    echo "Starting Nginx..."
                    sudo systemctl start nginx
                    sudo systemctl enable nginx
                    ;;
                centos)
                    # 对于CentOS系统
                    install_nginx_centos
                    # Start and enable Nginx service
                    echo "Starting Nginx..."
                    sudo systemctl start nginx
                    sudo systemctl enable nginx
                    ;;
                alpine)
                    # 对于Alpine系统
                    install_nginx_alpine
                    # Start and enable Nginx service
                    echo "Starting Nginx..."
                    rc-service nginx start
                    rc-update add nginx default
                    ;;
                *)
                    yellow "不支持的Linux发行版: $osRelease"
                    ;;
            esac

            if [[ $isContinueInput == [Yy] ]]; then
            isContinueInput=${isContinueInput:-Y}
                start_menu
            else 
                exit 0
            fi
        ;;

        7 )
            curl https://get.acme.sh | sh -s email=cdhcudgv@dasihcys.com
        ;;

        9 )
            reboot
        ;;

        0 )
            exit 0
        ;;

        * )
            clear
            red "请输入正确数字 !"
            sleep 2s
            start_menu
        ;;
    esac

}

# fonts color
function red(){
    echo -e "\033[31m\033[01m$1\033[0m"
}
function green(){
    echo -e "\033[32m\033[01m$1\033[0m"
}
function yellow(){
    echo -e "\033[33m\033[01m$1\033[0m"
}
function blue(){
    echo -e "\033[34m\033[01m$1\033[0m"
}
function bold(){
    echo -e "\033[1m\033[01m$1\033[0m"
}

# 检测系统发行版代号，返回centos,debian,ubuntu,alpine,openwrt,other
function getLinuxOSRelease(){
    
    if [[ -f /etc/redhat-release ]]; then
        osRelease="centos"
    elif cat /etc/issue | grep -Eqi "debian|raspbian"; then
        osRelease="debian"
    elif cat /etc/issue | grep -Eqi "ubuntu"; then
        osRelease="ubuntu"
    elif cat /etc/issue | grep -Eqi "centos|red hat|redhat"; then
        osRelease="centos"
    elif cat /etc/issue | grep -Eqi "alpine"; then
        osRelease="alpine"
    elif cat /proc/version | grep -Eqi "debian|raspbian"; then
        osRelease="debian"
    elif cat /proc/version | grep -Eqi "ubuntu"; then
        osRelease="ubuntu"
    elif cat /proc/version | grep -Eqi "centos|red hat|redhat"; then
        osRelease="centos"
    elif cat /proc/version | grep -Eqi "alpine"; then
        osRelease="alpine"
    elif command -v opkg >/dev/null 2>&1; then
        osRelease="openwrt"
    else
        osRelease="other"
    fi

}

# 判断服务器是否在中国
function getServerLocal(){
    if [[ $(curl -m 10 -s https://ipapi.co/json | grep 'China') != "" ]]; then
        isChina=1
    else
        isChina=0
    fi

}

# 写入 SSH公钥
function setPublicKey(){

    if [ -d /etc/dropbear ]; then
        # dropbear
        
        echo "$publicKey" >> /etc/dropbear/authorized_keys
        chmod 700 /etc/dropbear
        chmod 600 /etc/dropbear/authorized_keys
        
        # 重启dropbear服务
        if command -v systemctl &>/dev/null; then
            systemctl restart dropbear
        elif command -v service &>/dev/null; then
            service dropbear restart
        fi

    elif [ -f /etc/ssh/sshd_config ]; then
        # sshd
        
        if [ ! -d "/root/ssh" ]; then
            mkdir -p /root/.ssh
        fi

        echo "$publicKey" > /root/.ssh/authorized_keys
        chmod 700 /root/.ssh
        chmod 600 /root/.ssh/authorized_keys

        # 禁用SSH密码认证
        sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
        sed -i 's/^PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

        green "禁用SSH密码认证，并写入SSH公钥成功!"

        # 重启SSH服务
        if command -v systemctl &>/dev/null; then
            systemctl restart sshd
        elif command -v service &>/dev/null; then
            service ssh restart
        fi
    else
        yellow "SSH公钥导入失败，无法识别SSH Server的类型" 
    fi

}


# 设置北京时区
function setLinuxDateZone(){

    tempCurrentDateZone=$(date +'%z')

    echo
    if [[ ${tempCurrentDateZone} == "+0800" ]]; then
        yellow "当前时区已经为北京时间  $tempCurrentDateZone | $(date -R) "
    else 

        if [[ -f /etc/localtime ]] && [[ -f /usr/share/zoneinfo/Asia/Shanghai ]];  then
            mv /etc/localtime /etc/localtime.bak
            cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

            yellow " 当前时区已设置为 $(date -R)"
            green " =================================================="
        fi

    fi


}

# 安装CA
function installCA(){
    # 根据不同的发行版，执行不同的命令导入证书
    case $osRelease in
        ubuntu|debian)
            # 对于Ubuntu和Debian系统
            echo "$RSA_Content" > "/usr/local/share/ca-certificates/SMY-Root-CA-RSA.crt"
            echo "$ECC_Content" > "/usr/local/share/ca-certificates/SMY-Root-CA-ECC.crt"
            update-ca-certificates
            ;;
        centos)
            # 对于CentOS系统
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
            yellow "不支持的Linux发行版: $osRelease"
            ;;
    esac

    green "证书已导入并更新。"
    

}

# Function to install Nginx for Ubuntu
install_nginx_ubuntu() {
    echo "Adding Nginx repository for Ubuntu..."
    wget https://nginx.org/keys/nginx_signing.key
    sudo apt-key add nginx_signing.key
    sudo sh -c "echo 'deb https://nginx.org/packages/ubuntu/ `lsb_release -cs` nginx' > /etc/apt/sources.list.d/nginx.list"
    sudo sh -c "echo 'deb-src https://nginx.org/packages/ubuntu/ `lsb_release -cs` nginx' >> /etc/apt/sources.list.d/nginx.list"
    sudo apt-get update
    echo "Installing Nginx..."
    sudo apt-get install -y nginx
}

# Function to install Nginx for Debian
install_nginx_debian() {
    echo "Adding Nginx repository for Debian..."
    wget https://nginx.org/keys/nginx_signing.key
    sudo apt-key add nginx_signing.key
    sudo sh -c "echo 'deb https://nginx.org/packages/debian/ `lsb_release -cs` nginx' > /etc/apt/sources.list.d/nginx.list"
    sudo sh -c "echo 'deb-src https://nginx.org/packages/debian/ `lsb_release -cs` nginx' >> /etc/apt/sources.list.d/nginx.list"
    sudo apt-get update
    echo "Installing Nginx..."
    sudo apt-get install -y nginx
}

# Function to install Nginx for CentOS/RHEL
install_nginx_centos() {
    echo "Adding Nginx repository for CentOS/RHEL..."
    cat > /etc/yum.repos.d/nginx.repo <<EOL
[nginx-stable]
name=nginx stable repository
baseurl=https://nginx.org/packages/centos/\$releasever/\$basearch/
gpgcheck=1
enabled=1
gpgkey=https://nginx.org/keys/nginx_signing.key
module_hotfixes=true
EOL
    echo "Installing Nginx..."
    sudo yum install -y nginx
}


# Function to install Nginx for alpine
install_nginx_alpine() {
    ALPINE_VERSION=$(cat /etc/alpine-release | cut -d '.' -f 1-2)
    echo "http://nginx.org/packages/alpine/v${ALPINE_VERSION}/main" >> /etc/apk/repositories
    curl -o /tmp/nginx_signing.rsa.pub https://nginx.org/keys/nginx_signing.rsa.pub
    sudo mv /tmp/nginx_signing.rsa.pub /etc/apk/keys/
    apk update
    apk add nginx
}

# 接收到的参数，选择要执行的操作
case $1 in
    ca)
        getLinuxOSRelease
        # 安装 SMY Root Certification Authority
        installCA
        exit 0
        ;;
    root)
        getLinuxOSRelease
        # 配置SSH及Root账户
            
        if [ ! $2 ]; then
            yellow "Error:Password empty"
            exit 1
        fi
        echo "root:$2" | chpasswd
        setPublicKey
        exit 0
        ;;
    *)
        getLinuxOSRelease
        start_menu
        ;;
esac
