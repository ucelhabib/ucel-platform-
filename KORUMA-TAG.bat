@echo off
cd /d "%~dp0"

echo ============================================
echo   KORUMA TAG - v223-stable
echo ============================================
echo.

echo === v238-stable tag (guncel HEAD = v238) ===
git tag -a v238-stable HEAD -m "Stabil v238: revizyon boy yuvarlamasi (12/6m) + sessiz revizyon + v237 miktar revizyonu"

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
