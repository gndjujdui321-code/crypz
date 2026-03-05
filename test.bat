@echo off
:: Set code page to UTF-8 just in case
chcp 65001 >nul

echo === Checking UAC ===
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA
if %errorlevel%==0 (
    echo EnableLUA key found.
) else (
    echo EnableLUA key NOT found.
)

echo.
echo === Checking Windows Defender ===
reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware
if %errorlevel%==0 (
    echo DisableAntiSpyware key found.
) else (
    echo DisableAntiSpyware key NOT found.
)

reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring
if %errorlevel%==0 (
    echo DisableRealtimeMonitoring key found.
) else (
    echo DisableRealtimeMonitoring key NOT found.
)

echo.
echo === Checking Windows Defender Processes ===
tasklist /FI "IMAGENAME eq MsMpEng.exe"
if %errorlevel%==0 (
    echo MsMpEng.exe process found.
) else (
    echo MsMpEng.exe process NOT found.
)

tasklist /FI "IMAGENAME eq SecurityHealthSystray.exe"
if %errorlevel%==0 (
    echo SecurityHealthSystray.exe process found.
) else (
    echo SecurityHealthSystray.exe process NOT found.
)

echo.
echo Script finished.
echo Press any key to exit...
pause >nul
