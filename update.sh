#!/usr/bin/env sh

file=$(curl "https://plugins.jetbrains.com/api/plugins/7499/updates?channel=&size=8" | jq -r '.[0] | .file')

version=$(echo $file | grep -o '[0-9]\+\.[0-9]\+\.[0-9]\+_[0-9]\+')
version_jar=$(echo $version | tr '_' '+')
 
echo $version
echo $version_jar

zipName=gittoolbox-"$version"-signed.zip
jarName=gittoolbox-"$version_jar".jar
targetName=gittoolbox-"$version".zip

rm -rf gittoolbox

wget https://plugins.jetbrains.com/files/7499/487998/"$zipName" -O gittoolbox-"$version"-signed.zip

unzip "$zipName"

rm -rf "$zipName"

jar xf gittoolbox/lib/"$jarName"

cp -f zielu/gittoolbox/ResourceBundle.properties en/gittoolbox/ResourceBundle.properties
cp -f zielu/intellij/ZResBundle.properties en/intellij/ZResBundle.properties