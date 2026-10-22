@echo off
title Push PricePilot AI Final Project to GitHub
echo ====================================================
echo  PricePilot AI - Pushing Final Project to GitHub (main)
echo  Repo: https://github.com/yuvrajcet26-dotcom/PricePlotAi.git
echo ====================================================
echo.
git add .
git commit -m "feat: Complete PricePilot AI Final Project with all dashboards, inventory, and yuvrajcet26@gmail.com gateway"
git branch -M main
git remote remove origin 2>nul
git remote add origin https://github.com/yuvrajcet26-dotcom/PricePlotAi.git
echo.
echo Pushing to GitHub main branch...
git push -u origin main --force
echo.
echo ====================================================
echo  Push complete! Final Project is live on GitHub & Vercel!
echo ====================================================
pause
