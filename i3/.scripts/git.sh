#!/bin/sh

git add .
git status
echo "Commit Name : $@"
git commit -m "$@"
git push

