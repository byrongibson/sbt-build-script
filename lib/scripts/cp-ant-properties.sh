#!/usr/bin/env bash -

#Copy ant-build-script properties files, and convert to SBT properties files by 
#replacing = with :=

cp ./lib/submodules/ant-build-script/config/default.properties ./project/default.properties.ant
cp ./lib/submodules/ant-build-script/config/project.properties ./project/project.properties.ant


