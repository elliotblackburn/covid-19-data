#!/bin/bash

set -eu

# Absolute path to this script. /home/user/bin/foo.sh
# SCRIPT=$(readlink -f $0)
# Absolute path this script is in. /home/user/bin
SCRIPTPATH=`dirname $0`

main() {
    echo "switching into IT directory"
    cd $SCRIPTPATH

    if [ -d "raw-data-src" ]; then
        echo "scrubbing old raw data repo"
        rm -rf "raw-data-src"
    fi

    echo "cloning target repo"
    git clone "https://github.com/pcm-dpc/COVID-19.git" "raw-data-src" --depth 1

    echo "data cloned into raw-data-src dir"

    if [ -d "data" ]; then
        echo "scrubbing old processed data for clean start"
        rm -rf "data"
    fi

    cd -
}

main
