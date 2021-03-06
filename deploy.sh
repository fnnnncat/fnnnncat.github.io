#!/bin/sh

# If a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Build the project.
rm -rf public/* && hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public

echo "fnncat.com" > CNAME

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
        msg="$*"
        fi
        git commit --amend --date="`date`" -m "$msg"

# Push source and build repos.
git push -f origin master
