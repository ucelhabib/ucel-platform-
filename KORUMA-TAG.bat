@echo off
cd /d "%~dp0"

echo ============================================
echo   KORUMA TAG - v218-stable
echo ============================================
echo.

echo === v219-stable tag (guncel HEAD = v219) ===
git tag -a v219-stable HEAD -m "Stabil v219: Hizalama bug fix, sevkiyat/sipariş/fatura senkronizasyon iyilestirmeleri"

echo === Tag'i uzak repoya push et ===
git push origin --tags

echo.
echo === Tum stabil tag'ler ===
git tag -l "v21*-stable"
echo.
echo Acil geri donus:
echo   git reset --hard v218-stable
echo   git push --force origin main
echo.
pause
