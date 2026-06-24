@echo off
:: ============================================================
:: ÜÇEL Steel Construction — Klasör Açma Kurulum
:: ============================================================
:: Bu .bat dosyasına ÇİFT TIKLAYIN.
:: UCEL klasör açma helper script'i %APPDATA%\UCEL\ altına kopyalar
:: ve ucelopen:// protokolünü kaydeder.
:: Türkçe karakter sorunu olmaz, her bilgisayarda çalışır.
:: ============================================================
chcp 65001 >nul
set "TARGET=%APPDATA%\UCEL"
echo Kurulum baslatiliyor...
echo Hedef klasor: %TARGET%

if not exist "%TARGET%" mkdir "%TARGET%"

:: Helper PowerShell script'i kopyala
copy /Y "%~dp0UCEL_KlasorAc.ps1" "%TARGET%\UCEL_KlasorAc.ps1" >nul
if errorlevel 1 (
  echo HATA: UCEL_KlasorAc.ps1 bulunamadi. Bu .bat dosyasi UCEL_KlasorAc.ps1 ile ayni klasorde olmali.
  pause
  exit /b 1
)

:: Registry kayit dosyasi olustur (Turkce karakter sorunu olmasin diye dinamik)
set "REG=%TEMP%\ucel_register.reg"
> "%REG%" echo Windows Registry Editor Version 5.00
>> "%REG%" echo.
>> "%REG%" echo [HKEY_CURRENT_USER\Software\Classes\ucelopen]
>> "%REG%" echo @="URL:UCEL Open Folder"
>> "%REG%" echo "URL Protocol"=""
>> "%REG%" echo.
>> "%REG%" echo [HKEY_CURRENT_USER\Software\Classes\ucelopen\DefaultIcon]
>> "%REG%" echo @="explorer.exe,1"
>> "%REG%" echo.
>> "%REG%" echo [HKEY_CURRENT_USER\Software\Classes\ucelopen\shell]
>> "%REG%" echo.
>> "%REG%" echo [HKEY_CURRENT_USER\Software\Classes\ucelopen\shell\open]
>> "%REG%" echo.
>> "%REG%" echo [HKEY_CURRENT_USER\Software\Classes\ucelopen\shell\open\command]
>> "%REG%" echo @="powershell.exe -NoProfile -ExecutionPolicy Bypass -File \"%%APPDATA%%\\UCEL\\UCEL_KlasorAc.ps1\" -Url \"%%1\""

:: Path'i registry'ye yaz — Turkce karakter olmayan AppData yolu sayesinde sorun yok
reg import "%REG%" >nul 2>&1
if errorlevel 1 (
  echo HATA: Registry kayit edilemedi.
  pause
  exit /b 1
)

del /Q "%REG%" >nul 2>&1

echo.
echo ====================================================
echo  Kurulum TAMAMLANDI
echo ====================================================
echo Helper: %TARGET%\UCEL_KlasorAc.ps1
echo Kayit:  HKCU\Software\Classes\ucelopen
echo.
echo TEST: Win+R basip su komutu yazabilirsiniz:
echo    ucelopen://test
echo.
echo Tarayicida UCEL uygulamasinda "Ac" butonuna bastiginizda
echo Chrome diyaloga cikabilir — "Her zaman izin ver" secin.
echo ====================================================
pause
