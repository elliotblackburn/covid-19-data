const mkdirp = require('mkdirp');
const util = require('util');
const writeFile = util.promisify(require('fs').writeFile);
const exec = util.promisify(require('child_process').exec);

function process() {
    return translate_data();
}

function translate_data() {
    const dir = `${__dirname}/data`;
    const raw_data_dir = `${__dirname}/raw-data-src/dati-json`;
    
    return mkdirp(dir).then(() => {
        return translate_national_data(raw_data_dir, dir);
    });
}

function translate_national_data(raw_data_dir, destination_dir) {
    const data_file_path = `${raw_data_dir}/dpc-covid19-ita-andamento-nazionale.json`;
    const destination_path = `${destination_dir}/national-data.json`;
    const data = require(data_file_path);

    const translated_data = data.map(translate_national_block);

    const data_str = JSON.stringify(translated_data, null, 2);
    return writeFile(destination_path, data_str);
}

function translate_national_block(raw_data) {
    return {
        date: raw_data.data,
        state: raw_data.stato,
        hospitalized_with_symptoms: raw_data.ricoverati_con_sintomi,
        intensive_care: raw_data.terapia_intensiva,
        total_hospitalised: raw_data.totale_ospedalizzati,
        home_isolation: raw_data.isolamento_domiciliare,
        total_currently_positive: raw_data.totale_attualmente_positivi,
        new_currently_positive: raw_data.nuovi_attualmente_positivi,
        discharged_recovered: raw_data.dimessi_guariti,
        deseased: raw_data.deceduti,
        total_cases: raw_data.totale_casi,
        total_tested: raw_data.tamponi,
    }
}

process();
