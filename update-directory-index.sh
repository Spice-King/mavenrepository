#!/bin/bash
# Release Repository
sheets=$PWD"/stylesheets"
function relative {
	source="`cd $1; pwd`"
	target=$sheets
	common_part=$source
	back=
	while [ "${target#$common_part}" = "${target}" ]; do
	common_part=$(dirname "${common_part}")
	back="../${back}"
	done
	
	echo -e "${back}${target#$common_part/}"
}
for DIR in $(find ./releases -type d); do
  (
    echo -e "<html>\n<link rel=\"stylesheet\" type=\"text/css\" href=\""
	relative $DIR
	echo -e "/stylesheet.css\" media=\"screen\" />\n<link rel=\"stylesheet\" type=\"text/css\" href=\""
	relative $DIR
	echo -e "/pygment_trac.css\" media=\"screen\" />\n<link rel=\"stylesheet\" type=\"text/css\" href=\""
	relative $DIR
	echo -e "/print.css\" media=\"print\" /><body>\n<header><div class=\"container\"><h1>Spice-King's Maven Releases Repository</h1></div></header>\n<div class=\"container\"><section id=\"main_content\"><pre>"
    ls -1pa "${DIR}" | grep -v "^\./$" | grep -v "index.html" | awk '{ printf "<a href=\"%s\">%s</a>\n",$1,$1 }' 
    echo -e "</pre></section></div>\n</body>\n</html>"
  ) > "${DIR}/index.html"
done

# Snapshot Repository
for DIR in $(find ./snapshots -type d); do
  (
    echo -e "<html>\n<link rel=\"stylesheet\" type=\"text/css\" href=\""
	relative $DIR
	echo -e "/stylesheet.css\" media=\"screen\" />\n<link rel=\"stylesheet\" type=\"text/css\" href=\""
	relative $DIR
	echo -e "/pygment_trac.css\" media=\"screen\" />\n<link rel=\"stylesheet\" type=\"text/css\" href=\""
	relative $DIR
	echo -e "/print.css\" media=\"print\" /><body>\n<header><div class=\"container\"><h1>Spice-King's Maven Snapshots Repository</h1></div></header>\n<div class=\"container\"><section id=\"main_content\"><pre>"
    ls -1pa "${DIR}" | grep -v "^\./$" | grep -v "index.html" | awk '{ printf "<a href=\"%s\">%s</a>\n",$1,$1 }' 
    echo -e "</pre></section></div>\n</body>\n</html>"
  ) > "${DIR}/index.html"
done
