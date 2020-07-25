#!/bin/sh

# 引数で指定した任意のdockerfileを取り出すshell script
echo "cp -R ./docker/$1/ ."
echo "rm -rf docker"