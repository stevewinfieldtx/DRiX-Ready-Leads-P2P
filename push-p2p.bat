@echo off
cd /d "%~dp0"
echo ============================================
echo   DRiX P2P - Build and Push to GitHub
echo ============================================
echo.

echo [1/5] Verifying git remote...
git remote set-url origin https://github.com/stevewinfieldtx/DRiX-Ready-Leads-P2P.git
git remote -v
echo.

echo [2/5] Installing client dependencies...
cd /d "%~dp0client"
call npm install
if errorlevel 1 (
    echo ERROR: npm install failed!
    pause
    exit /b 1
)
echo.

echo [3/5] Building client (this creates the dist/ folder)...
call npx vite build
if errorlevel 1 (
    echo ERROR: vite build failed! Dist was NOT updated.
    pause
    exit /b 1
)
cd /d "%~dp0"
echo.

echo [4/5] Adding and committing all files...
git add -A
git commit -m "deploy: P2P standalone update %date% %time%"
echo.

echo [5/5] Pushing to GitHub...
git push origin main --force
echo.

echo ============================================
echo   DONE! Check: https://github.com/stevewinfieldtx/DRiX-Ready-Leads-P2P
echo   Railway should auto-deploy shortly.
echo ============================================
pause
