#!/usr/bin/env bash

for f in *.scheme; do
  ./compile-scheme.rb -s $f
done
