@echo off
cd /d "%~dp0"

echo ============================================
echo   KORUMA TAG - v223-stable
echo ============================================
echo.

echo === v223-stable tag (guncel HEAD = v223) ===
git tag -a v223-stable HEAD -m "Stabil v223: Dikkat paneli sikistirma + faz tarihleri toplu kaydet + KPI tiklanabilir + Aktif/Tamamlanan sekmeleri"

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
