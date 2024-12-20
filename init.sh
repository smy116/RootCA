#!/bin/bash

osRelease=""
isChina=0

publicKey="ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIETbOuKJEi5BUJXkCopshD/dfAKTOphKM9fqffCH5v+Y SMY"

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
    green " SMY One-click deployment script"
    green " Support: / Debian / Ubuntu / Openwrt / Alpine"
    green " ================================================================="
    green " System type：$osRelease"
    echo
    green " 1. Set the Time zone to UTC+8"
    green " 2. Configure SSH and Root accounts"
    green " 3. Set SSH port to 54422"
    green " 4. Install SMY Root Certification Authority"
    green " 5. Run Nezha-agent script"
    green " 6. Run BBR Cloudflare WARP script"
    green " 7. Install Nginx Stable version"
    green " 8. Run ACME Shell script: acme.sh"
    green " 9. Reboot system"
    green " 0. Exit script"

    echo
    read -p "Please input number:" menuNumberInput
    case "$menuNumberInput" in

        1 )
        #1. 设置北京时区
            echo "设置北京时区........"
            setLinuxDateZone

            read -p "Return to the Menu? Enter to return to the Menu by Default, Please enter [Y/n]:" isContinueInput
            isContinueInput=${isContinueInput:-Y}

            if [[ $isContinueInput == [Yy] ]]; then
                start_menu
            else 
                exit 0
            fi
            
        ;;

        2 )
        #2. 配置SSH及Root账户 
            echo "Set SSH root login........"
            yellow "Please enter a new root password"
            passwd root
            green "Change root password successful！"
            echo "Import SSH public key........"
            setPublicKey
            green "Successful！, Please login to the server using SSH tool software!"
            
            read -p "Return to the Menu? Enter to return to the Menu by Default, Please enter [Y/n]:" isContinueInput
            isContinueInput=${isContinueInput:-Y}

            if [[ $isContinueInput == [Yy] ]]; then
                start_menu
            else 
                exit 0
            fi

        ;;

        3 )
        #3. 修改 SSH 端口为 54422
            changeSshPort 0
            read -p "Return to the Menu? Enter to return to the Menu by Default, Please enter [Y/n]:" isContinueInput
            isContinueInput=${isContinueInput:-Y}

            if [[ $isContinueInput == [Yy] ]]; then
                start_menu
            else 
                exit 0
            fi
        ;;

        4 )
        #4. 安装 SMY Root Certification Authority
            installCA
            echo "Please manually reboot to make the changes take effect"
            read -p "Return to the Menu? Enter to return to the Menu by Default, Please enter [Y/n]:" isContinueInput
            isContinueInput=${isContinueInput:-Y}

            if [[ $isContinueInput == [Yy] ]]; then
                start_menu
            else 
                exit 0
            fi
        ;;

        5 )
        #5. 运行哪吒监控 Agent 安装脚本
            
            read -p "Enter the Nezha Client Secret:" nezhaClientSecret
            if [[ $nezhaClientSecret == "" ]]; then
                yellow "Client Secret is empty！"
                sleep 2s
                start_menu
            fi
            curl -L https://raw.githubusercontent.com/nezhahq/scripts/main/agent/install.sh -o nezha.sh && chmod +x nezha.sh && env NZ_SERVER=status.smy.me:443 NZ_TLS=true NZ_DISABLE_COMMAND_EXECUTE=true NZ_DISABLE_NAT=true NZ_CLIENT_SECRET=$nezhaClientSecret ./nezha.sh
 
        ;;

        6 )
        #6. 运行 Linux内核 BBR Cloudflare WARP安装脚本
            getServerLocal
            if [ $isChina -eq 1 ]; then
                curl -O https://cdn.jsdelivr.net/gh/jinwyp/one_click_script@master/install_kernel.sh && chmod +x ./install_kernel.sh && ./install_kernel.sh
            else
                curl -O https://raw.githubusercontent.com/jinwyp/one_click_script/master/install_kernel.sh && chmod +x ./install_kernel.sh && ./install_kernel.sh
            fi
            
        ;;

        7 )
        #7. 从 Nginx 源安装 Nginx Stable version
            
            # 根据不同的发行版，选择不同的安装方式
            case $osRelease in
                ubuntu)
                    # 对于Ubuntu系统
                    install_nginx_ubuntu
                    create_nginx_config
                    # Start and enable Nginx service
                    echo "Starting Nginx..."
                    sudo systemctl start nginx
                    sudo systemctl enable nginx
                    ;;
                debian)
                    # 对于Debian系统
                    install_nginx_debian
                    create_nginx_config
                    # Start and enable Nginx service
                    echo "Starting Nginx..."
                    sudo systemctl start nginx
                    sudo systemctl enable nginx
                    ;;
                centos)
                    # 对于CentOS系统
                    install_nginx_centos
                    create_nginx_config
                    # Start and enable Nginx service
                    echo "Starting Nginx..."
                    sudo systemctl start nginx
                    sudo systemctl enable nginx
                    ;;
                alpine)
                    # 对于Alpine系统
                    install_nginx_alpine
                    create_nginx_config
                    # Start and enable Nginx service
                    echo "Starting Nginx..."
                    rc-service nginx start
                    rc-update add nginx default
                    ;;
                *)
                    yellow "Unsupported Linux version: $osRelease"
                    ;;
            esac

            if [[ $isContinueInput == [Yy] ]]; then
            isContinueInput=${isContinueInput:-Y}
                start_menu
            else 
                exit 0
            fi
        ;;

        8 )
        #8. 运行 ACME Shell script: acme.sh
            curl https://get.acme.sh | sh -s email=cdhcudgv@dasihcys.com
        ;;

        9 )
        #9. 重启系统
            reboot
        ;;

        0 )
            exit 0
        ;;

        * )
            clear
            red "Please enter the option!"
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

        green "Disable SSH password authentication and successfully import SSH public key!"

        # 重启SSH服务
        if command -v systemctl &>/dev/null; then
            systemctl restart sshd
        elif command -v service &>/dev/null; then
            service ssh restart
        fi
    else
        yellow "SSH public key import failed, Unable to recognize SSH Server" 
    fi

}


# 设置北京时区
function setLinuxDateZone(){

    tempCurrentDateZone=$(date +'%z')

    echo
    if [[ ${tempCurrentDateZone} == "+0800" ]]; then
        yellow "The current Time-zone is already set to UTC+8 $tempCurrentDateZone | $(date -R) "
    else 

        if [[ -f /etc/localtime ]] && [[ -f /usr/share/zoneinfo/Asia/Shanghai ]];  then
            mv /etc/localtime /etc/localtime.bak
            cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

            yellow " The current time zone has been set to $(date -R)"
            green " =================================================="
        fi

    fi


}

# 修改ssh端口
function changeSshPort(){

    if [ -f /etc/default/dropbear ]; then
        # dropbear
        sed -i "/DROPBEAR_PORT/c\DROPBEAR_PORT=54422" /etc/default/dropbear
        sed -i "s/^DROPBEAR_PORT=.*/DROPBEAR_PORT=54422/" /etc/default/dropbear
        

        green "Successfully modified SSH port! The new port is 54422"

        if [ $1 = 1 ]; then
            service dropbear restart
            echo "Restart SSH server"
        fi
    
    elif [ -f /etc/config/dropbear ]; then
        uci set dropbear.@dropbear[0].Port=54422
        uci commit dropbear
        green "Successfully modified SSH port! The new port is 54422"

        if [ $1 = 1 ]; then
            /etc/init.d/dropbear restart
            echo "Restart SSH server"
        fi

    elif [ -f /etc/ssh/sshd_config ]; then
        # sshd

        sed -i "/^#Port .*/c\Port 54422" /etc/ssh/sshd_config
        sudo sed -i "s/^Port .*/Port 54422/" /etc/ssh/sshd_config
        
        if [ $1 = 1 ]; then
            systemctl restart sshd
            echo "Restart SSH server"
        fi
        green "Successfully modified SSH port! The new port is 54422"


    else
        yellow "SSH port modification failed, Unable to recognize SSH Server" 
    fi

}

# 安装CA
function installCA(){
    # 根据不同的发行版，执行不同的命令导入证书
    case $osRelease in
        ubuntu|debian)
            # 对于Ubuntu和Debian系统
            apt install -y ca-certificates
            echo "$ECC_Content" > "/usr/local/share/ca-certificates/SMY-Root-CA.crt"
            update-ca-certificates
            ;;
        centos)
            # 对于CentOS系统
            echo "$ECC_Content" > "/etc/pki/ca-trust/source/anchors/SMY-Root-CA.crt"
            update-ca-trust extract
            ;;
        openwrt)
            # 对于OpenWrt系统
            echo "$ECC_Content" > "/etc/ssl/certs/SMY-Root-CA.crt"
            ;;
        *)
            yellow "Unsupported Linux version: $osRelease"
            ;;
    esac

    green "CA has been imported and updated"
    

}

# Function to install Nginx for Ubuntu
install_nginx_ubuntu() {
    apt update
    apt install -y curl gnupg2 ca-certificates lsb-release ubuntu-keyring
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
    apt update
    apt install -y curl gnupg2 ca-certificates lsb-release debian-archive-keyring
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
    yum install yum-utils
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
    apk update
    apk add openssl curl ca-certificates
    ALPINE_VERSION=$(cat /etc/alpine-release | cut -d '.' -f 1-2)
    echo "http://nginx.org/packages/alpine/v${ALPINE_VERSION}/main" >> /etc/apk/repositories
    curl -o /tmp/nginx_signing.rsa.pub https://nginx.org/keys/nginx_signing.rsa.pub
    mv /tmp/nginx_signing.rsa.pub /etc/apk/keys/
    apk update
    apk add nginx
}

create_nginx_config() {
    mkdir -p /usr/share/nginx/acme-challenge
    mkdir -p /usr/share/nginx/html

    # download html
    curl -o html.tar.gz  https://cdn.jsdelivr.net/gh/smy116/RootCA@main/nginx/html.tar.gz
    tar -zxvf html.tar.gz -C /usr/share/nginx/html
    rm -rf html.tar.gz
    
    # build dhparam.pem
    openssl dhparam -dsaparam -out /etc/ssl/certs/dhparam.pem 4096

    # write config
    curl -o /etc/nginx/nginx.conf  https://cdn.jsdelivr.net/gh/smy116/RootCA@main/nginx/nginx.conf
}

# 接收到的参数，选择要执行的操作
case $1 in
    ca)
        getLinuxOSRelease
        # 安装 SMY Root Certification Authority
        installCA
        exit 0
        ;;

    sshport)
        getLinuxOSRelease
        # 修改 SSH 端口为 54422
        changeSshPort 1
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
