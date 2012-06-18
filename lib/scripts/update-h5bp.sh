#!/usr/bin/env bash -

mkdir -p src/main/web/h5bp/src
git submodule update
cp -rf submodules/html5-boilerplate/* src/main/web/h5bp/src
