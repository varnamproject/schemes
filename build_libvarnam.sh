#!/usr/bin/env bash

git clone https://github.com/varnamproject/libvarnam.git libvarnam

cd libvarnam
mkdir -p build
cd build
cmake ..
cmake --build . --config Release
mv libvarnam.so* ../../
