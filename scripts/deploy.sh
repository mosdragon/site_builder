#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Copy CNAME file in bc it keeps getting deleted.
cp CNAME public/CNAME

# Go To Public folder
cd public

# Add changes to git.
git add .

# Commit changes.
msg="Rebuilding site at: `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -am "$msg"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ..
