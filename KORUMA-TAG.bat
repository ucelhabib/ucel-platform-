@echo off
cd /d "%~dp0"

echo ============================================
echo   KORUMA TAG - v223-stable
echo ============================================
echo.

echo === v228-stable tag (guncel HEAD = v228) ===
git tag -a v228-stable HEAD -m "Stabil v228: mobil sohbet yazma alani alt menu ustunde (klavye acik/kapali)"

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
