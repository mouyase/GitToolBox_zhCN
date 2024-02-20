#!/usr/bin/env sh

json_file_name=version.json
curl "https://plugins.jetbrains.com/api/plugins/7499/updates?channel=&size=8" -o $json_file_name

file_id=$(cat $json_file_name | jq -r '.[0] | .id')
version_jar=$(cat $json_file_name | jq -r '.[0] | .version')
version=$(echo $version_jar | tr '+' '_')
 
zipName=gittoolbox-"$version"-signed.zip
jarName=gittoolbox-"$version_jar".jar
targetName=gittoolbox-"$version".zip

wget "https://plugins.jetbrains.com/plugin/download?rel=true&updateId=$file_id" -O gittoolbox-"$version"-signed.zip

unzip "$zipName"

rm -rf "$zipName"

cp -rf zh zielu

jar uf gittoolbox/lib/"$jarName" zielu/*

zip -r "$targetName" gittoolbox/*

rm -rf gittoolbox
rm -rf zielu
rm -rf META-INF
rm -rf $json_file_name
rm -rf $targetName