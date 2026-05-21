@echo off
chcp 65001 >nul
setlocal

cd /d "%~dp0"

echo ============================================
echo   ÜÇEL Platform - Otomatik Push
echo ============================================
echo.

REM 0) OneDrive lock'larini temizle
if exist ".git\index.lock" (
  echo [0/5] .git\index.lock siliniyor...
  del /F /Q ".git\index.lock" 2>nul
)

REM 1) Eski index.html sil
if exist "index.html" (
  echo [1/5] Eski index.html siliniyor...
  del /F /Q "index.html"
  if errorlevel 1 (
    echo HATA: index.html silinemedi. Lutfen tum tarayicilari kapatip tekrar dene.
    pause
    exit /b 1
  )
)

REM 2) index_new.html -> index.html
if exist "index_new.html" (
  echo [2/5] index_new.html -^> index.html
  ren "index_new.html" "index.html"
) else (
  echo UYARI: index_new.html bulunamadi - belki zaten yeniden adlandirilmis.
)

REM 3) Yardimci dosyalari sil
if exist "TODO_INDEX_HTML.md" del /F /Q "TODO_INDEX_HTML.md"
if exist "patch_index.py" del /F /Q "patch_index.py"

REM 4) Git islemleri
echo [3/5] Git add...
git add -A
if errorlevel 1 ( echo HATA: git add basarisiz & pause & exit /b 1 )

echo [4/5] Git commit...
git commit -m "v8: PWA + Ayarlar + sesli bildirim + dosya yukleme + %% rakami"
if errorlevel 1 (
  echo UYARI: commit yapilamadi (belki commit edilecek bir sey yok).
)

echo [5/5] Git push origin main...
git push origin main
if errorlevel 1 (
  echo.
  echo HATA: Push basarisiz oldu.
  echo Sebep: GitHub kimlik dogrulamasi gerekli.
  echo.
  echo Cozum:
  echo   - GitHub Desktop kullan, ya da
  echo   - GitHub Personal Access Token ile https URL'sini guncelle
  echo.
  pause
  exit /b 1
)

echo.
echo ============================================
echo   BASARILI! Push tamamlandi.
echo   Site 1-2 dakika icinde guncellenecek:
echo   https://ucelhabib.github.io/ucel-platform-/
echo ============================================
pause
