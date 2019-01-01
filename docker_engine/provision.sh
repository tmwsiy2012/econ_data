#!/usr/bin/env bash


ONET_VERSION=23_1
DB_URL=http://www.onetcenter.org/dl_files/database/db_${ONET_VERSION}_mysql.zip
OE_URL=http://download.bls.gov/pub/time.series/oe/
PROJECT_ROOT=/home/vagrant/econ_data

hostname econ_data-eng
echo "econ_data-eng" > /etc/hostname
apk update
apk add docker git
service docker start 
rc-update add docker boot 
sed -i s/docker:x:101:/docker:x:101:vagrant/g /etc/group
su - vagrant -c "git clone https://github.com/tmwsiy2012/econ_data ${PROJECT_ROOT} -q"
git config --global user.email "eddie@eddiedunn.com"
git config --global user.name "Eddie Dunn"
mkdir -p ${PROJECT_ROOT}/tempdata
wget -q $DB_URL -P ${PROJECT_ROOT}/tempdata
unzip ${PROJECT_ROOT}/tempdata/db_${ONET_VERSION}_mysql.zip -d ${PROJECT_ROOT}/tempdata
mv ${PROJECT_ROOT}/tempdata/db_${ONET_VERSION}_mysql/*.sql ${PROJECT_ROOT}/tempdata
rm -rf ${PROJECT_ROOT}/tempdata/db_${ONET_VERSION}_mysql/
rm -rf ${PROJECT_ROOT}/tempdata/db_${ONET_VERSION}_mysql.zip
docker run --name econ_data -e POSTGRES_PASSWORD=password -v ${PROJECT_ROOT}/tempdata:/docker-entrypoint-initdb.d -d postgres
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

mysql -u root -p$db_passwd < bls_oe_create_tables.sql
mysql -u root -p$db_passwd < bls_oe_data_import.sql
# wait five minutes and then delte the tempdata
sleep 300 && rm -rf ${PROJECT_ROOT}/tempdata/ & 
