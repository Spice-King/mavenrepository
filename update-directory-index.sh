#!/bin/bash
# Release Repository
for DIR in $(find ./releases -type d); do
  (
    echo -e "<html>\n<body>\n<h1>Spice-King's Maven Repository - Releases only</h1>\n<hr/>\n<pre>"
    ls -1pa "${DIR}" | grep -v "^\./$" | grep -v "index.html" | awk '{ printf "<a href=\"%s\">%s</a>\n",$1,$1 }' 
    echo -e "</pre>\n</body>\n</html>"
  ) > "${DIR}/index.html"
done

# Snapshot Repository
for DIR in $(find ./snapshots -type d); do
  (
    echo -e "<html>\n<body>\n<h1>Spice-King's Maven Repository - SNAPSHOTS only</h1>\n<hr/>\n<pre>"
    ls -1pa "${DIR}" | grep -v "^\./$" | grep -v "index.html" | awk '{ printf "<a href=\"%s\">%s</a>\n",$1,$1 }' 
    echo -e "</pre>\n</body>\n</html>"
  ) > "${DIR}/index.html"
done
