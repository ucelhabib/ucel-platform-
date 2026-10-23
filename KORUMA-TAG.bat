@echo off
cd /d "%~dp0"

echo ============================================
echo   KORUMA TAG - v223-stable
echo ============================================
echo.

echo === v229-stable tag (guncel HEAD = v229) ===
git tag -a v229-stable HEAD -m "Stabil v229: mobil sohbet yukseklik ayari sayfaya giriste de calisiyor"

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
