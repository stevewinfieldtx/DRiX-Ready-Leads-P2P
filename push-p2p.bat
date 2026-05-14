@echo off
cd /d "%~dp0"
echo ============================================
echo   DRiX P2P - Build and Push to GitHub
echo ============================================
echo.

echo [1/6] Initializing git repo...
git init
echo.

echo [2/6] Setting remote...
git remote add origin https://github.com/stevewinfieldtx/DRiX-Ready-Leads-P2P.git 2>nul || git remote set-url origin https://github.com/stevewinfieldtx/DRiX-Ready-Leads-P2P.git
git remote -v
echo.

echo [3/6] Installing client dependencies...
cd client
call npm install
echo.

echo [4/6] Building client (this creates the dist/ folder)...
call npx vite build
cd ..
echo.

echo [5/6] Adding and committing all files...
git add -A
git commit -m "feat: Add P2P Partner Collaboration mode - New /p2p route with warm amber/teal theme - Partner A + Partner B input flow - Revenue split suggestions on strategy cards - Distinct visual identity from standard leads mode"
echo.

echo [6/6] Pushing to GitHub (force push since fresh init)...
git branch -M main
git push -u origin main --force
echo.

echo ============================================
echo   DONE! Check: https://github.com/stevewinfieldtx/DRiX-Ready-Leads-P2P
echo   Railway should auto-deploy shortly.
echo ============================================
pause
