@echo off
cd /d "%~dp0"

echo ============================================
echo   KORUMA TAG - v223-stable
echo ============================================
echo.

echo === v231-stable tag (guncel HEAD = v231) ===
git tag -a v231-stable HEAD -m "Stabil v231: mobil sohbet ekrana sabit duzen (WhatsApp mantigi) - yukseklik hesabi kaldirildi"

echo === Tag'i uzak repoya push et ===
git push origin --tags

echo.
echo === Tum stabil tag'ler ===
git tag -l "v2*-stable"
echo.
echo Acil geri donus:
echo   git reset --hard v222-stable
echo   git push --force origin main
echo.
pause
