@echo off
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system" && (
    goto :continue
) || (
    echo ���Թ���Ա������У�
    pause
    exit
)

:continue
echo ������ϵͳ֤������SMY Root Certification Authority
pause
.\certmgr.exe -add SMY-Root-CA-RSA.crt -c -s -r localMachine root
echo ����� SMY Root Certification Authority RSA
.\certmgr.exe -add SMY-Root-CA-ECC.crt -c -s -r localMachine root
echo ����� SMY Root Certification Authority ECC
pause
exit