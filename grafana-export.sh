#!/bin/bash

set -o errexit
set -o pipefail

FULLURL="$1"
headers="Authorization: Bearer $2"
in_path=dashboards_export
set -o nounset

echo "Exporting Grafana dashboards from ${FULLURL}"
mkdir -p ${in_path}
for dash in $(curl -H "${headers}" -s "${FULLURL}/api/search?query=&" | jq -r '.[] | select(.type == "dash-db") | .uid'); do
        curl -H "${headers}" -s "${FULLURL}/api/search?query=&" 1>/dev/null
        dash_path="${in_path}/${dash}.json"
        curl -H "${headers}" -s "${FULLURL}/api/dashboards/uid/${dash}" | jq -r . > ${dash_path}
        jq -r .dashboard ${dash_path} > ${in_path}/dashboard.json
        title=$(jq -r .dashboard.title ${dash_path})
        folder="$(jq -r '.meta.folderTitle' ${dash_path})"
        mkdir -p "${folder}"
        mv -f ${in_path}/dashboard.json "${folder}/${title}.json"
        sed -i '/"id": [0-9]\+,/d' "${folder}/${title}.json"
        sed -i 's/"version": [0-9]\+,/"version": 1,/g' "${folder}/${title}.json"
        sed -i -z 's@"datasource": {\n\s\+"type": "prometheus",\n\s\+"uid": "\w\+"\n\s\+},\n@"datasource": {\n"type": "prometheus"\n},\n@g' "${folder}/${title}.json"
        jq . "${folder}/${title}.json" > "${folder}/${title}.json"
        echo "exported ${folder}/${title}.json"

done
rm -r ${in_path}

