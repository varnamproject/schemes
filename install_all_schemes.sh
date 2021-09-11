#!/usr/bin/env bash

sudo mkdir -p /usr/local/share/varnam/schemes/
for scheme in schemes/*/*.vst; do
  echo $scheme;
  sudo cp $scheme /usr/local/share/varnam/schemes/
done
