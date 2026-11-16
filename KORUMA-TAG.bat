@echo off
cd /d "%~dp0"

echo ============================================
echo   KORUMA TAG - v223-stable
echo ============================================
echo.

echo === v235-stable tag (guncel HEAD = v235) ===
git tag -a v235-stable HEAD -m "Stabil v235: kalici satin alma siralamasi + liste kesilme fix + stok iadesi"

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
