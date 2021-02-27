::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWHreyHcjLQlHcDevBVeeCaIS5Of66/m7kEISQMEeRIzeyKCbNOkfpED8cPY=
::fBE1pAF6MU+EWHreyHcjLQlHcDevBVeeCaIS5Of66/m7kEISQMEeRLz24/m8D88np2bFO5U/who=
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFCh5dTimM3y0Crod7PvH3eWItm48aOMzdIqIl7CPdecKpxW0JNgk1XU6
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF65
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF65
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpSI=
::egkzugNsPRvcWATEpSI=
::dAsiuh18IRvcCxnZtBNQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFCh5dTimM3y0Crod7PvH/e/S8RlTUfo6GA==
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
echo ================================
echo SMY ROOT CA证书导入工具
echo ================================

echo 按任意键将SMY ROOT CA证书导入计算机
pause >nul


certutil.exe -addstore "Root" SMY-ROOT-CA.crt >nul

echo 导入成功！
pause