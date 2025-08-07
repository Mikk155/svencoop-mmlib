#!/bin/sh

cd ..
mkdir build; cd build
cmake .. -DCMAKE_BUILD_TYPE=RELEASE $@
make
