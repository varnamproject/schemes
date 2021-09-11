#!/usr/bin/env bash

cd schemes

schemes=("as" "bn" "gu" "hi" "kn" "ml" "ml-inscript" "mr" "ne" "or" "pa" "sa" "ta" "te")
for f in ${schemes[@]}; do
  cp ../install.sh.in $f/install.sh
  zip -r ../$f.zip $f -x '*.scheme' -x '*.txt' -x '*.vst.learnings*'
done