#!/bin/bash

set -e

catch() {
    if [ "$1" == "0" ]; then
        return
    fi
    rm $typefacename
}

trap 'catch $?' EXIT

typefacename=$1
src=$(dirname $0)

$src/sfd2ttf.pe ${typefacename%.ttf}.sfd $typefacename
$src/add-non-English-names.py --ta குஞ்சிதபாதம் --sa 𑌕𑍁𑌞𑍍𑌚𑌿𑌤𑌪𑌾𑌦𑌃 $typefacename
gftools fix-unwanted-tables --tables FFTM $typefacename
gftools fix-dsig --autofix $typefacename
