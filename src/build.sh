#!/bin/bash

set -e

catch() {
    if [ "$1" == "0" ]; then
        return
    fi
    rm $FILENAME
}

trap 'catch $?' EXIT

SRCDIR=$(dirname $0)

while getopts f:t:s: OPTLET; do
  case $OPTLET in
    f)
        FILENAME=$OPTARG
        ;;
    t)
        TA_NAME=$OPTARG
        ;;
    s)
        SA_NAME=$OPTARG
        ;;
    *)
        exit 2
        ;;
  esac
done

$SRCDIR/sfd2ttf.pe ${FILENAME%.ttf}.sfd $FILENAME
$SRCDIR/add-non-English-names.py --ta $TA_NAME --sa $SA_NAME $FILENAME
gftools-fix-unwanted-tables --tables FFTM $FILENAME
