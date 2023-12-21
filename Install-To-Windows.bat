@echo off
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system" && (
    goto :continue
) || (
    echo 请以管理员身份运行！
    pause
    exit
)

:continue
echo 即将向系统证书库添加SMY Root Certification Authority
pause
.\certmgr.exe -add SMY-Root-CA-RSA.crt -c -s -r localMachine root
echo 已添加 SMY Root Certification Authority RSA
.\certmgr.exe -add SMY-Root-CA-ECC.crt -c -s -r localMachine root
echo 已添加 SMY Root Certification Authority ECC
pause
exit