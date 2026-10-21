@echo off
cd /d "%~dp0"

echo ============================================
echo   KORUMA TAG - v223-stable
echo ============================================
echo.

echo === v226-stable tag (guncel HEAD = v226) ===
git tag -a v226-stable HEAD -m "Stabil v226: kok neden duzeltmesi - faz bitince gorev kapanir, tamamlanmis projeye uyari uretilmez, hatirlatma dogru birime"

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
