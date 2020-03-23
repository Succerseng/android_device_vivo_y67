#!/bin/sh
cd frameworks/av
git checkout -- . && git clean -df
cd ../base
git checkout -- . && git clean -df
cd ../native
git checkout -- . && git clean -df
cd ../../bionic
git checkout -- . && git clean -df
cd ../core
git checkout -- . && git clean -df
cd ../sepolicy
git checkout -- . && git clean -df
cd ../..