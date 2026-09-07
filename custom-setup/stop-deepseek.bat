@echo off
REM DeepSeek Harness 停止脚本

echo ========================================
echo Stopping DeepSeek Harness
echo ========================================
echo.

REM 查找占用 3080 端口的进程
for /f "tokens=5" %%a in ('netstat -ano ^| findstr ":3080" ^| findstr "LISTENING"') do (
    set PID=%%a
)

if defined PID (
    echo [INFO] Found DeepSeek Harness process (PID: %PID%)
    echo [INFO] Stopping...
    taskkill /PID %PID% /F >nul 2>&1
    if %errorlevel% equ 0 (
        echo.
        echo ========================================
        echo [SUCCESS] DeepSeek Harness has stopped
        echo ========================================
    ) else (
        echo.
        echo ========================================
        echo [ERROR] Failed to stop process
        echo ========================================
    )
) else (
    echo [INFO] DeepSeek Harness is not running
)

echo.
timeout /t 3
