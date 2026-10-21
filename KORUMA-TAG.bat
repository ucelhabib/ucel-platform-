@echo off
cd /d "%~dp0"

echo ============================================
echo   KORUMA TAG - v223-stable
echo ============================================
echo.

echo === v225-stable tag (guncel HEAD = v225) ===
git tag -a v225-stable HEAD -m "Stabil v225: proje no sola hizali + eylem uyari kolonu (onay bekliyor / gecikme)"

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
