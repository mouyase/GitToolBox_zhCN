#!/usr/bin/env sh

version=500.1.10_222
jarVersion=500.1.10+222

zipName=gittoolbox-"$version"-signed.zip
jarName=gittoolbox-"$jarVersion".jar
targetName=gittoolbox-"$version".zip

rm -rf gittoolbox

wget https://plugins.jetbrains.com/files/7499/487998/"$zipName" -O gittoolbox-"$version"-signed.zip

unzip "$zipName"

jar uf gittoolbox/lib/"$jarName" zh/*

#unzip "$jarName"

#jar -C origin/ xf gittoolbox/lib/"$jarName"

#cp -rf zh/* origin/*
#
#cd origin
#
#jar xf "../$jarName" -C origin/
#
#cd ..
#
#cp -f "$jarName" gittoolbox/lib/"$jarName"
#
zip -r "$targetName" gittoolbox/*
