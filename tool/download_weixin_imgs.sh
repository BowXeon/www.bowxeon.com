#!/bin/bash
set -ex
file_base=${1?"e.g. 2020-05-01"}
urls=$(grep data-src tmp.html | awk -F '"|?' '{print $2}')
i=0
for url in $urls
do
    i=$(( $i + 1 ))
    if (( $i <= 9 )); then
        curl $url -o ../assets/img/blog/${file_base}-0${i}.png
    else
        curl $url -o ../assets/img/blog/${file_base}-${i}.png
    fi
done
echo -e "\nNew Image Files as below: \n$(ls ../assets/img/blog/${file_base}*)"
