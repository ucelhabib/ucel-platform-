@echo off
chcp 65001 >nul
title Ucel Platform - Otomatik Kurulum
color 0B
cls

echo.
echo  ============================================================
echo    UCEL PLATFORM - OTOMATIK KURULUM
echo  ============================================================
echo.
echo  Bu script sirasiyla sunlari yapar:
echo    1. Git kurulu mu kontrol eder, yoksa kurar
echo    2. Git'i sizin adiniza tanitir
echo    3. projeler klasorunuzu GitHub repo'sunuza baglar
echo    4. deploy.bat scriptini hazirlar
echo.
echo  Bittiginde tek yapmaniz: deploy.bat'a cift tiklamak.
echo.
pause
cls

REM ===== ADIM 1: GIT KONTROL =====
echo  [1/4] Git kontrol ediliyor...
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo  Git bulunamadi. Kuruluyor... (1-2 dakika)
    winget install --id Git.Git -e --accept-source-agreements --accept-package-agreements --silent
    if %errorlevel% neq 0 (
        echo.
        echo  HATA: Git kurulamadi. Manuel kurun: https://git-scm.com/download/win
        pause
        exit /b 1
    )
    echo.
    echo  Git kuruldu. Yeni PATH icin lutfen bu pencereyi KAPATIN
    echo  ve setup.bat'a TEKRAR cift tiklayin.
    pause
    exit /b 0
)
echo    [OK] Git mevcut:
git --version
echo.

REM ===== ADIM 2: GIT KIMLIK =====
echo  [2/4] Git kimliginiz ayarlaniyor...
git config --global user.name "Habib Ilgin"
git config --global user.email "ucelhabib@gmail.com"
git config --global credential.helper manager
git config --global init.defaultBranch main
echo    [OK] Kimlik: Habib Ilgin / ucelhabib@gmail.com
echo.

REM ===== ADIM 3: REPO BAGLAMA =====
echo  [3/4] Klasor GitHub repo'sunuza baglaniyor...
cd /d "%~dp0"

REM GitHub kullanici adini sor
set GH_USER=ucelhabib
echo.
echo  GitHub kullanici adiniz: %GH_USER%
echo  (Farkliysa Ctrl+C ile iptal edip script icindeki GH_USER'i degistirin)
echo.
timeout /t 3 >nul

REM Git repo init kontrol
if exist ".git" (
    echo    [OK] Klasor zaten git repo'su
) else (
    git init
    git branch -M main
)

REM Remote ekle veya guncelle
git remote remove origin >nul 2>&1
git remote add origin https://github.com/%GH_USER%/ucel-platform.git

REM GitHub icerigini cek (ilk push'ta tarayicidan onay isteyecek)
echo.
echo  GitHub'dan mevcut icerigi cekiliyor...
echo  Eger tarayicidan GitHub giris istegi gelirse onaylayin.
echo.
git fetch origin main
git reset --hard origin/main
if %errorlevel% neq 0 (
    echo.
    echo  UYARI: GitHub'a baglanilamadi. Repo adi/kullanici dogrumu?
    echo  Repo URL: https://github.com/%GH_USER%/ucel-platform
    pause
)
echo    [OK] Repo bagli

REM ===== ADIM 4: DEPLOY.BAT YAZ =====
echo.
echo  [4/4] deploy.bat olusturuluyor...
(
    echo @echo off
    echo chcp 65001 ^>nul
    echo title Ucel Platform - Deploy
    echo color 0A
    echo cls
    echo cd /d "%%~dp0"
    echo echo.
    echo echo  ============================================
    echo echo    UCEL PLATFORM - GITHUB'A YUKLE
    echo echo  ============================================
    echo echo.
    echo git add -A
    echo for /f "tokens=*" %%%%i in ^('git status --porcelain'^) do set CHANGES=%%%%i
    echo if "%%CHANGES%%"=="" ^(
    echo     echo  Hicbir degisiklik yok. Yukleyecek bir sey yok.
    echo     pause
    echo     exit /b 0
    echo ^)
    echo echo  Degisiklikler:
    echo git status --short
    echo echo.
    echo set /p MSG="Commit mesaji ^(bos birakirsaniz: 'Update'^): "
    echo if "%%MSG%%"=="" set MSG=Update
    echo git commit -m "%%MSG%%"
    echo echo.
    echo echo  GitHub'a gonderiliyor...
    echo git push origin main
    echo if %%errorlevel%% equ 0 ^(
    echo     echo.
    echo     echo  ============================================
    echo     echo    BASARILI! Vercel ~30 saniyede yayinlar.
    echo     echo    https://ucel-platform.vercel.app
    echo     echo  ============================================
    echo ^) else ^(
    echo     echo  HATA: Gonderim basarisiz.
    echo ^)
    echo echo.
    echo pause
) > deploy.bat
echo    [OK] deploy.bat hazir

echo.
echo  ============================================================
echo    KURULUM TAMAM!
echo  ============================================================
echo.
echo  Bundan sonra:
echo    - Claude bir degisiklik yaptiginda
echo    - 'deploy.bat'a cift tiklayin
echo    - Commit mesaji yazin (veya bos birakin)
echo    - 30 saniyede sitede yayinda
echo.
echo  Site: https://ucel-platform.vercel.app
echo.
pause
