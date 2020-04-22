#!/bin/bash

set -eu

# Absolute path to this script. /home/user/bin/foo.sh
# SCRIPT=$(readlink -f $0)
# Absolute path this script is in. /home/user/bin
SCRIPTPATH=`dirname $0`

main() {
    echo "switching into UK directory"
    cd $SCRIPTPATH
    pwd

    if [ -f "data/cases.csv" ]; then
        echo "scrubbing old raw data csv"
        rm "data/cases.csv"
    fi

    if [ ! -d "data" ]; then
        mkdir "data"
    fi

    echo "fetching target csv"
    wget https://coronavirus.data.gov.uk/downloads/csv/coronavirus-cases_latest.csv
    mv coronavirus-cases_latest.csv ./data/uk-national-cases.csv

    wget https://coronavirus.data.gov.uk/downloads/csv/coronavirus-deaths_latest.csv
    mv coronavirus-deaths_latest.csv ./data/uk-national-deaths.csv

    echo "data fetched into data dir"

    cd -
}

main
