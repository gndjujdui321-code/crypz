@echo off
echo === Checking UAC ===
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA >nul 2>&1
if %errorlevel%==0 (
    echo EnableLUA key FOUND
) else (
    echo EnableLUA key NOT found
)

echo.
echo === Checking Windows Defender ===
reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware >nul 2>&1
if %errorlevel%==0 (
    echo DisableAntiSpyware key FOUND
) else (
    echo DisableAntiSpyware key NOT found
)

reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring >nul 2>&1
if %errorlevel%==0 (
    echo DisableRealtimeMonitoring key FOUND
) else (
    echo DisableRealtimeMonitoring key NOT found
)

echo.
echo === Checking Windows Defender Processes ===
tasklist /FI "IMAGENAME eq MsMpEng.exe" | findstr /I "MsMpEng.exe" >nul
if %errorlevel%==0 (
    echo MsMpEng.exe process FOUND
) else (
    echo MsMpEng.exe process NOT found
)

tasklist /FI "IMAGENAME eq SecurityHealthSystray.exe" | findstr /I "SecurityHealthSystray.exe" >nul
if %errorlevel%==0 (
    echo SecurityHealthSystray.exe process FOUND
) else (
    echo SecurityHealthSystray.exe process NOT found
)

echo.
echo Script finished. Press any key to exit...
pause >nul
