@echo off
chcp 65001 >nul
setlocal
cd /d "%~dp0"

echo ============================================
echo   ÜÇEL Platform - index.html GERİ YÜKLE
echo ============================================
echo.

REM 0) OneDrive lock'ları temizle
if exist ".git\index.lock" (
  echo [0/3] .git\index.lock siliniyor...
  del /F /Q ".git\index.lock" 2>nul
)

REM 1) index.html var mı kontrol et
if not exist "index.html" (
  echo HATA: index.html bulunamadi. Bu dosya bulunmali.
  pause
  exit /b 1
)
echo [1/3] index.html bulundu (OK)

REM 2) Git add + commit
echo [2/3] Git add + commit...
git add index.html
git commit -m "fix: restore index.html (v8 features)"
if errorlevel 1 (
  echo UYARI: commit yapilamadi (belki degisiklik yok).
)

REM 3) Push
echo [3/3] Git push origin main...
git push origin main
if errorlevel 1 (
  echo.
  echo HATA: Push basarisiz.
  echo Sebep: GitHub kimlik dogrulama gerekli olabilir.
  echo Cozum: GitHub Desktop ac, "Push origin" tikla.
  pause
  exit /b 1
)

echo.
echo ============================================
echo   BASARILI! Site 1-2 dakika icinde duzelir:
echo   https://ucelhabib.github.io/ucel-platform-/
echo ============================================
pause
