@echo off
title PricePilot AI - Milestone 3 Full-Stack Platform
color 0B
echo =====================================================================
echo           PRICEPILOT AI - MILESTONE 3 DYNAMIC PRICING SYSTEM         
echo =====================================================================
echo.

:: Detect Python executable
set "PY_EXE=C:\Users\jojo\.gemini\antigravity\scratch\python311\python.exe"
if not exist "%PY_EXE%" (
    where python >nul 2>nul
    if %ERRORLEVEL% equ 0 (
        set "PY_EXE=python"
    ) else (
        echo [!] Python executable not found in default path or PATH.
        echo [!] Launching frontend dashboard directly in browser...
        start "" "%~dp0frontend\index.html"
        pause
        exit /b 0
    )
)

echo [1/3] Python detected: "%PY_EXE%"
echo [2/3] Starting PricePilot AI Backend Server (FastAPI + ML Models)...
start "PricePilot AI Backend" /B "%PY_EXE%" -m uvicorn app.main:app --app-dir "%~dp0backend" --host 127.0.0.1 --port 8000
timeout /t 2 /nobreak >nul

echo [3/3] Opening Interactive Intelligence Dashboard in Browser...
start "" "%~dp0frontend\index.html"

echo.
echo =====================================================================
echo  PricePilot AI Platform is Live!
echo  - Frontend Dashboard: %~dp0frontend\index.html
echo  - Backend API:        http://127.0.0.1:8000
echo  - Swagger API Docs:   http://127.0.0.1:8000/docs
echo =====================================================================
echo.
echo Leave this window open while using the application.
echo Press any key to stop or exit...
pause >nul
