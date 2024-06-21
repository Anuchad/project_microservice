@echo off
setlocal enabledelayedexpansion

echo Start check vertion release tag
cd "C:\Users\Anuch\OneDrive\project_microservice"

rem ดึงข้อมูล tag ปัจจุบัน
for /f "delims=" %%a in ('git describe --tags') do (
    set tagc=%%a
    set current_tag=!tagc:~0,6!
)

rem ดึงข้อมูล tag ล่าสุดจาก git
for /f "delims=" %%i in ('git ls-remote --tags %gitRemote%') do set latest_tag=%%i
for /f "tokens=2" %%a in ("%latest_tag%") do (
    set tag=%%a
    set latest_tag=!tag:~10,6!
)

echo current_tag : %current_tag%
echo latest_tag : %latest_tag%

if "%current_tag%" neq "%latest_tag%" (
    echo Pulling latest changes...
    git pull
) else (
    echo No new changes to pull.
)

echo End script