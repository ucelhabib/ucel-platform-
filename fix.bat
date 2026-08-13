@echo off
cd /d "%~dp0"

echo ============================================
echo   UCEL Platform - PUSH
echo ============================================
echo.

if exist ".git\index.lock" del /F /Q ".git\index.lock" 2>nul
if exist ".git\HEAD.lock" del /F /Q ".git\HEAD.lock" 2>nul

echo Git add...
git add -A
echo.

echo Git commit...
git commit -m "auto push"
echo.

echo Git push...
git push origin main
echo.

echo ============================================
echo   BITTI - pencere kapatmak icin bir tusa bas
echo ============================================
pause
