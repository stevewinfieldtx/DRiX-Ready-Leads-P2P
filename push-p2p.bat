@echo off
cd /d "%~dp0"
echo === DRiX P2P Push to GitHub ===
echo.

echo Setting remote to correct repo...
git remote set-url origin https://github.com/stevewinfieldtx/DRiX-Ready-Leads-P2P.git 2>nul || git remote add origin https://github.com/stevewinfieldtx/DRiX-Ready-Leads-P2P.git

echo.
echo Current remote:
git remote -v

echo.
echo Checking status...
git status --short

echo.
echo Adding all changes...
git add -A

echo.
echo Committing...
git commit -m "feat: Add P2P Partner Collaboration mode - New /p2p route with warm amber/teal theme - Partner A + Partner B input flow (replaces Reseller + Solution) - Revenue split suggestions on strategy cards - Full CSS variable override for distinct visual identity - Same intelligence pipeline, completely different look"

echo.
echo Pushing to GitHub...
git push origin main
if errorlevel 1 (
    echo.
    echo Trying 'master' branch instead...
    git push origin master
)

echo.
echo === Done! Railway should auto-deploy from GitHub. ===
echo Visit: https://github.com/stevewinfieldtx/DRiX-Ready-Leads-P2P
pause
