#!/bin/sh
# Usage: add.sh url name

cd `git rev-parse --git-dir`/..
git submodule add $1 home/.vim/bundle/$2
cd -
