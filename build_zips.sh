#!/usr/bin/env bash

cd schemes

schemes=("as" "bn" "gu" "hi" "kn" "ml" "ml-inscript" "mr" "ne" "or" "pa" "sa" "ta" "te")
for schemeID in ${schemes[@]}; do
  cp ../install.sh.in $schemeID/install.sh
  sed -i "s#@INSTALL_PREFIX@#/usr/local#g" $schemeID/install.sh
  chmod +x $schemeID/install.sh
  zip -r ../$schemeID.zip $schemeID -x '*.scheme' -x '*.txt' -x '*.vst.learnings*'
done