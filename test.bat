@echo off
::
:: SIQI Security Disabler (только для демонстрации, безопасно)
:: Здесь мы будем показывать статус каждой команды

echo === Проверка UAC ===
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA
if %errorlevel%==0 (
    echo Ключ EnableLUA найден
) else (
    echo Ключ EnableLUA не найден
)

echo.
echo === Проверка Defender ===
reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware
if %errorlevel%==0 (
    echo DisableAntiSpyware найден
) else (
    echo DisableAntiSpyware не найден
)

reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring
if %errorlevel%==0 (
    echo DisableRealtimeMonitoring найден
) else (
    echo DisableRealtimeMonitoring не найден
)

echo.
echo === Проверка процессов Windows Defender ===
tasklist /FI "IMAGENAME eq MsMpEng.exe"
if %errorlevel%==0 (
    echo Процесс MsMpEng.exe найден
) else (
    echo Процесс MsMpEng.exe не найден
)

tasklist /FI "IMAGENAME eq SecurityHealthSystray.exe"
if %errorlevel%==0 (
    echo Процесс SecurityHealthSystray.exe найден
) else (
    echo Процесс SecurityHealthSystray.exe не найден
)

echo.
echo Скрипт завершил выполнение.
echo Нажмите любую клавишу, чтобы выйти...
pause >nul