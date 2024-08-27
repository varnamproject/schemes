#!/usr/bin/env bash

set -e

schemes=("as" "bn" "gu" "hi" "kn" "ml" "ml-inscript" "mr" "ne" "or" "pa" "sa" "ta" "te")
for schemeID in ${schemes[@]}; do
  for packDir in schemes/$schemeID/*/ ; do
    if [ -d "$packDir" ]; then
      echo "$packDir"
      python3 scripts/make-pack.py $schemeID $packDir
    fi
  done
done
