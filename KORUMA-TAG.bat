@echo off
cd /d "%~dp0"

echo ============================================
echo   KORUMA TAG - v221-stable
echo ============================================
echo.

echo === v221-stable tag (guncel HEAD = v221) ===
git tag -a v221-stable HEAD -m "Stabil v221: approvePhase auto-advance - yonetici onayi sonrasi asama otomatik sonraki faza geciyor"

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
