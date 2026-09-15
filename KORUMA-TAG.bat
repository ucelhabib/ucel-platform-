@echo off
cd /d "%~dp0"

echo ============================================
echo   KORUMA TAG - v222-stable
echo ============================================
echo.

echo === v222-stable tag (guncel HEAD = v222) ===
git tag -a v222-stable HEAD -m "Stabil v222: Sosyal medya modulu kaldirildi (666 satir), sadelestirme"

echo === Tag'i uzak repoya push et ===
git push origin --tags

echo.
echo === Tum stabil tag'ler ===
git tag -l "v2*-stable"
echo.
echo Acil geri donus:
echo   git reset --hard v221-stable
echo   git push --force origin main
echo.
pause
