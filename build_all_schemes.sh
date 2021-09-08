#!/usr/bin/env bash

schemes=("as" "bn" "gu" "hi" "kn" "ml" "ml-inscript" "mr" "ne" "or" "pa" "sa" "ta" "te")
for f in ${schemes[@]}; do
  ./compile-scheme.rb -s languages/$f/$f.scheme -o languages/$f/$f.vst
done
