@echo off
cd /d "%~dp0"
echo === DRiX P2P Push to GitHub ===
echo.

echo Checking status...
git status

echo.
echo Adding all changes...
git add -A

echo.
echo Committing...
git commit -m "feat: Add P2P Partner Collaboration mode - New /p2p route with warm amber/teal theme - Partner A + Partner B input flow (replaces Reseller + Solution) - Revenue split suggestions on strategy cards - Full CSS variable override for distinct visual identity - Same intelligence pipeline, completely different look"

echo.
echo Pushing to GitHub...
git push origin main

echo.
echo === Done! Railway should auto-deploy from GitHub. ===
pause
