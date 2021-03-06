#!/bin/sh
# If a command fails then the deploy stops
set -e
printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"
# Build the project.
#取線上最新
git pull origin main
#把hugo編輯檔轉成網頁資料，包在doc裡面
hugo -d docs # if using a theme, replace with `hugo -t <YOURTHEME>`
# Add changes to git.把doc加入變更
git add docs
# Commit changes.
msg="rebuilding site $(date) (only docs)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"
# Push source and build repos.
git push origin main