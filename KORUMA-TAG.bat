@echo off
cd /d "%~dp0"

echo ============================================
echo   KORUMA TAG - v215-stable ve v216-stable
echo ============================================
echo.

echo === v215-stable tag (eb9dcc2 = stabil v215) ===
git tag -a v215-stable eb9dcc2 -m "Stabil v215: canlida test edilmis, geri donus noktasi"

echo === v216-stable tag (guncel HEAD = v216) ===
git tag -a v216-stable HEAD -m "Stabil v216: tamamlanan projede sevk tarihi yesil"

echo === Tag'leri uzak repoya push et ===
git push origin --tags

echo.
echo === Sonuc ===
git tag -l "v21*-stable"
echo.
echo Geri donus komutu (acil durumda):
echo   git reset --hard v215-stable
echo   git push --force origin main
echo.
pause
