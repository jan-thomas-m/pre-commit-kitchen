#!/usr/bin/env bash
# shellcheck disable=SC1111   #  warning: This is a unicode quote. Delete and retype it (or ignore/singlequote for literal). [SC1111]

PREFIX='test'

[[ ! -d ${PREFIX} ]] && mkdir -p "${PREFIX}"

fname="${PREFIX}/test-with-bom.txt"
echo "Generating file '${fname}' with UTF-8 BOM"
printf '\xEF\xBB\xBF' > "${fname}"
echo 'This file has UTF-8 BOM' >> "${fname}"

fname="${PREFIX}/test-Test file.txt"
echo "Generating file '${fname}' with space and uppercase in filename, UTF-8-BOM, smart quotes (multi-byte / non-ISO8859 chars), white-space at eol, and no new-line at eof"
printf '\xEF\xBB\xBF' > "${fname}"
cat >> "${fname}" << X
This file has space in filename
It also has “smart quotes”...
And spases at end of line
Also no new-line at eof
X
echo -n 'eof' >> "${fname}"

fname="${PREFIX}/test-dos-format.txt"
echo "Generating file '${fname}' with DOS format"
echo -en "This file is in dos format\r\n" > "${fname}"

fname="${PREFIX}/speling+woke-errors.txt"
echo "Generating file '${fname}' with some spelling errors (for codespell)"
cat > "${fname}" << X

smiley
ALWAYS
about
exxit

We have a blklist
and that's woke!
blacklist and whitelist should not be used

nor maser or slave

man-hours is not good for sanity
they should be grandfathered

dummy guys in a whitebox blackbox

X
