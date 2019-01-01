#!/usr/bin/env bash


PROJECT_ROOT=/mnt/e/econ_data/backend_web
ONET_VERSION=23_1
DB_URL=http://www.onetcenter.org/dl_files/database/db_${ONET_VERSION}_mysql.zip
OE_URL=http://download.bls.gov/pub/time.series/oe/

mkdir -p ${PROJECT_ROOT}/tempdata

# pull onet files
wget -q $DB_URL -P ${PROJECT_ROOT}/tempdata
unzip ${PROJECT_ROOT}/tempdata/db_${ONET_VERSION}_mysql.zip -d ${PROJECT_ROOT}/tempdata
mv ${PROJECT_ROOT}/tempdata/db_${ONET_VERSION}_mysql/*.sql ${PROJECT_ROOT}/tempdata
rm -rf ${PROJECT_ROOT}/tempdata/db_${ONET_VERSION}_mysql/

wget -q ${OE_URL}/oe.area -P ${PROJECT_ROOT}/tempdata
wget -q ${OE_URL}/oe.areatype -P ${PROJECT_ROOT}/tempdata
wget -q ${OE_URL}/oe.contacts -P ${PROJECT_ROOT}/tempdata
wget -q ${OE_URL}/oe.data.1.AllData -P ${PROJECT_ROOT}/tempdata
wget -q ${OE_URL}/oe.datatype -P ${PROJECT_ROOT}/tempdata
wget -q ${OE_URL}/oe.footnote -P ${PROJECT_ROOT}/tempdata
wget -q ${OE_URL}/oe.industry -P ${PROJECT_ROOT}/tempdata
wget -q ${OE_URL}/oe.occupation -P ${PROJECT_ROOT}/tempdata
wget -q ${OE_URL}/oe.release -P ${PROJECT_ROOT}/tempdata
wget -q ${OE_URL}/oe.seasonal -P ${PROJECT_ROOT}/tempdata
wget -q ${OE_URL}/oe.sector -P ${PROJECT_ROOT}/tempdata
wget -q ${OE_URL}/oe.series -P ${PROJECT_ROOT}/tempdata
