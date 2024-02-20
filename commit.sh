#!/usr/bin/env sh
if [ -z $(git status --porcelain) ];
then
    echo "已经是最新"
else
    echo "有新的更新，需要提交"
    git add .
    git commit -m "feat: Update Version"
    git push
fi