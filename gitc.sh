#!/bin/bash
set -x
echo $1
if [ "$1" = 'google' ];then
    giturl=https://code.google.com/p/phpvim/
elif [ "$1" = 'github' ];then 
    giturl=git@github.com:huanle0610/phpvim.git
fi
echo $giturl
git remote rm origin 
git remote add origin $giturl
git remote -v
