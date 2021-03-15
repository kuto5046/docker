#!/bin/bash

# 引数で指定した任意のdockerfileを取り出すshell script
cp -R ./docker/$1/* .
cp -R ./docker/$1/.[^.]* .
rm -rf docker