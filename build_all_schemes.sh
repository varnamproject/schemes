#!/usr/bin/env bash

schemes=("as" "bn" "gu" "hi" "kn" "ml" "ml-inscript" "mr" "ne" "or" "pa" "sa" "ta" "te")
for f in ${schemes[@]}; do
  vst=schemes/$f/$f.vst
  ./compile-scheme.rb -s schemes/$f/$f.scheme -o $vst
  if [ -f schemes/$f/symbol-frequency-report.txt ]; then
    python3 scripts/symbol-weight-update-in-vst.py $vst schemes/$f/symbol-frequency-report.txt
  fi
done
