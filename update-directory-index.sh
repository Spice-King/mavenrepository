#!/bin/bash

# Release Repository
for DIR in $(find ./releases -type d); do
  (
	echo "---"
	echo "layout: default"
	echo "title: Releases"
	echo "---"
	echo "<pre>"
    ls -1pa "${DIR}" | grep -v "^\./$" | grep -v "index.markdown" | awk '{ printf "<a href=\"%s\">%s</a>\n",$1,$1 }' 
	echo "</pre>"
  ) > "${DIR}/index.markdown"
done

# Snapshot Repository
for DIR in $(find ./snapshots -type d); do
  (
	echo "---"
	echo "layout: default"
	echo "title: Snapshots"
	echo "---"
	echo "<pre>"
    ls -1pa "${DIR}" | grep -v "^\./$" | grep -v "index.markdown" | awk '{ printf "<a href=\"%s\">%s</a>\n",$1,$1 }' 
	echo "</pre>"
  ) > "${DIR}/index.markdown"
done
