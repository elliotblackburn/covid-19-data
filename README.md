# Coronavirus / Covid-19 / SARS-CoV-2 Data Sets

This repo is updated hourly with the latest data from several sources on the covid-19 pandemic. The data is sourced from individual countries published data sources. Where possible we include the original data sources (translated into English) a data set in a unified format to make analysis easy.

## Access the data

The easiest way to access all data processed here is by visiting [https://covid-19-datasets.now.sh](https://covid-19-datasets.now.sh). This site will allow you to query the data without any additional software or download. You can also use it to pull copies of the data in an sqlite format.

## Countries currently included

* Italy - The raw data is fetched and translated into English
* UK - Split into a cases dataset and a deaths dataset.

[Italy begun publishing their daily statistics on the covid-19 pandemic in Italy](https://github.com/pcm-dpc/COVID-19). The data structures are all in Italian, as an English speaker I wanted an up-to-date set of this data with English keys. This repo will update each hour with a translated set of the data.

## Raw data and sources

For access to the raw data sets you can either download the data from this repo (which are all translated into English) or you can visit the original sources. See below for details on each option.

* [`it/data/national-data.json`](./it/data/national-data.json) - The daily statistics for the outbreak for all of Italy. Also available in raw form . Sourced from the [PCM - DPC's github repo](https://github.com/pcm-dpc/COVID-19)
* [`uk/data/uk-national-cases-data.json`](./uk/data/uk-national-cases-data.json) - The daily statistics for the number of cases across the UK. Sourced from the [Public Health England national covid-19 data site](https://coronavirus.data.gov.uk/)