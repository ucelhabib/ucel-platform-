@echo off
cd /d "%~dp0"

echo ============================================
echo   KORUMA TAG - v223-stable
echo ============================================
echo.

echo === v239-stable tag (guncel HEAD = v239) ===
git tag -a v239-stable HEAD -m "Stabil v239: tarih gosterimi GG.AA.YYYY + v238 revizyon boy yuvarlamasi"

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
