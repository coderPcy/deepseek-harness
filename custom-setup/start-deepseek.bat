@echo off
REM DeepSeek Harness 启动脚本
REM 此脚本会自动检测服务状态并启动

cd /d "%~dp0.."
title DeepSeek Harness

REM 检查端口 3080 是否被占用
netstat -ano | findstr ":3080" | findstr "LISTENING" >nul
if %errorlevel% equ 0 (
    echo DeepSeek Harness is already running!
    start http://127.0.0.1:3080
    timeout /t 3 >nul
    exit
)

echo Starting DeepSeek Harness...
echo.
start /B cmd /c "timeout /t 8 >nul && start http://127.0.0.1:3080"
echo Browser will open in 8 seconds...
echo Press Ctrl+C to stop the service
echo.

npx @deepseek-ai/dsh web

pause
