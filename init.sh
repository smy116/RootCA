#!/bin/bash

export LC_ALL=C
#export LANG=C
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8


osInfo=""
osRelease=""
osReleaseVersionNo=""
osReleaseVersionNoShort=""
osReleaseVersionCodeName="CodeName"
osSystemPackage=""
osSystemMdPath=""
osSystemShell="bash"


publicKey="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCaK2pVOdTT8POACgWPJ52adBHmtgx462N/Fn22r7srjYJrvPZH+zOofEbvAUTurjXAL4RD+Lc78cZRCm+CYifpweA9gmS0UTo5PaFLTGruOCzMZHfpGDnSqw5CHMS00xQx1Yozq5e+x6cNxtM0ZdQYy0x1pkhdI+W+mZIUCMaM07469At2YNqxcIcTwIXZgAR2Bd9WiogDHvVoDo1yoQBIXNN+dpA23BJQGE+hNbnasUACI6SfN6HWok2rdyQAXvzuVa7QWjhjqT0HmST8l4f4vJ6DnCKP/yZSjoO0vc72IyHduLk9qVhjhsOehLoi7AXdsX5Ab7HggTZ00Uln+ZBz root@iZ2894t29fxZ"


sudoCmd=""
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
  sudoCmd="sudo"
fi

function  start_menu(){
    clear
    getLinuxOSRelease

    green " ===================================================================================================="
    green " SMY 环境一键部署脚本 | 系统支持：Centos / Debian / Ubuntu / Openwrt"
    green " ===================================================================================================="
    echo
    green " 1. 设置北京时区"
    green " 2. 配置SSH及Root账户"
    green " 3. 运行Linux内核 BBR Cloudflare WARP安装脚本"
    green " 4. 运行Trojan Trojan-go V2ray Xray 一键安装脚本"
    green " 5. 运行LNMP-键安装包 V1.9"
    green " 6. 运行ACME Shell script: acme.sh"
    green " 9. 重启系统"
    green " 0. 退出脚本"

    echo
    read -p "Please input number:" menuNumberInput
    case "$menuNumberInput" in

        1 )
            echo "设置北京时区........"
            setLinuxDateZone

            read -p "是否返回主菜单? 直接回车默认返回主菜单, 请输入[Y/n]:" isContinueInput
            isContinueInput=${isContinueInput:-Y}

            if [[ $isContinueInput == [Yy] ]]; then
                start_menu
            else 
                exit 1
            fi
            
        ;;

        2 )
            echo "写入SSH公钥........"
            setPublicKey
            echo "设置SSH root 登录........"
            setLinuxRootLogin

            read -p "是否返回主菜单? 直接回车默认返回主菜单, 请输入[Y/n]:" isContinueInput
            isContinueInput=${isContinueInput:-Y}

            if [[ $isContinueInput == [Yy] ]]; then
                start_menu
            else 
                exit 1
            fi

        ;;

        3 )
           wget --no-check-certificate https://raw.githubusercontent.com/jinwyp/one_click_script/master/install_kernel.sh && chmod +x ./install_kernel.sh && ./install_kernel.sh
        ;;

        4 )
            wget --no-check-certificate https://raw.githubusercontent.com/jinwyp/one_click_script/master/trojan_v2ray_install.sh && chmod +x ./trojan_v2ray_install.sh && ./trojan_v2ray_install.sh
        ;;

        5 )
            wget http://soft.vpser.net/lnmp/lnmp1.9.tar.gz -cO lnmp1.9.tar.gz && tar zxf lnmp1.9.tar.gz && cd lnmp1.9 && ./install.sh lnmp
        ;;

        6 )
            wget -O -  https://get.acme.sh | sh -s email=i@smy.me
        ;;

        9 )
            ${sudoCmd} reboot
        ;;

        0 )
            exit 1
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


# 检测系统发行版代号
function getLinuxOSRelease(){
    if [[ -f /etc/redhat-release ]]; then
        osRelease="centos"
        osSystemPackage="yum"
        osSystemMdPath="/usr/lib/systemd/system/"
        osReleaseVersionCodeName=""
    elif cat /etc/issue | grep -Eqi "debian|raspbian"; then
        osRelease="debian"
        osSystemPackage="apt-get"
        osSystemMdPath="/lib/systemd/system/"
        osReleaseVersionCodeName="buster"
    elif cat /etc/issue | grep -Eqi "ubuntu"; then
        osRelease="ubuntu"
        osSystemPackage="apt-get"
        osSystemMdPath="/lib/systemd/system/"
        osReleaseVersionCodeName="bionic"
    elif cat /etc/issue | grep -Eqi "centos|red hat|redhat"; then
        osRelease="centos"
        osSystemPackage="yum"
        osSystemMdPath="/usr/lib/systemd/system/"
        osReleaseVersionCodeName=""
    elif cat /proc/version | grep -Eqi "debian|raspbian"; then
        osRelease="debian"
        osSystemPackage="apt-get"
        osSystemMdPath="/lib/systemd/system/"
        osReleaseVersionCodeName="buster"
    elif cat /proc/version | grep -Eqi "ubuntu"; then
        osRelease="ubuntu"
        osSystemPackage="apt-get"
        osSystemMdPath="/lib/systemd/system/"
        osReleaseVersionCodeName="bionic"
    elif cat /proc/version | grep -Eqi "centos|red hat|redhat"; then
        osRelease="centos"
        osSystemPackage="yum"
        osSystemMdPath="/usr/lib/systemd/system/"
        osReleaseVersionCodeName=""
    fi


    [[ -z $(echo $SHELL|grep zsh) ]] && osSystemShell="bash" || osSystemShell="zsh"

}


# 写入 SSH公钥
function setPublicKey(){
    if [ ! -d "/root/ssh" ]; then
        ${sudoCmd} mkdir -p /root/.ssh
    fi

    ${sudoCmd} echo "$publicKey" > /root/.ssh/authorized_keys
    chmod 700 /root/.ssh
    chmod 600 /root/.ssh/authorized_keys

    # 确保sshd_config文件存在
    if [ -f /etc/ssh/sshd_config ]; then
        # 禁用SSH密码认证
        sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
        sed -i 's/^PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
    fi
    
    green "禁用SSH密码认证，并写入SSH公钥成功!"
    
}


# 设置SSH root 登录
function setLinuxRootLogin(){

    
    yellow "请输入新的root账户密码"
    ${sudoCmd} passwd root
    green "修改root密码为成功！"



    if [ "$osRelease" == "centos" ] || [ "$osRelease" == "debian" ] ; then
        ${sudoCmd} sed -i 's/#\?PermitRootLogin \(yes\|no\|Yes\|No\|prohibit-password\)/PermitRootLogin yes/g' /etc/ssh/sshd_config
    fi
    if [ "$osRelease" == "ubuntu" ]; then
        ${sudoCmd} sed -i 's/#\?PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
    fi
    green "设置允许root登陆成功!"


    if [ "$osRelease" == "centos" ] ; then

        ${sudoCmd} service sshd restart
        ${sudoCmd} systemctl restart sshd

    else
        ${sudoCmd} service ssh restart
        ${sudoCmd} systemctl restart ssh
     
    fi

    green "设置成功, 请用SSH工具软件登陆服务器!"
    

}


# 设置北京时区
function setLinuxDateZone(){

    tempCurrentDateZone=$(date +'%z')

    echo
    if [[ ${tempCurrentDateZone} == "+0800" ]]; then
        yellow "当前时区已经为北京时间  $tempCurrentDateZone | $(date -R) "
    else 

        if [[ -f /etc/localtime ]] && [[ -f /usr/share/zoneinfo/Asia/Shanghai ]];  then
            ${sudoCmd} mv /etc/localtime /etc/localtime.bak
            ${sudoCmd} cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

            yellow " 当前时区已设置为 $(date -R)"
            green " =================================================="
        fi

    fi
    

}

start_menu
