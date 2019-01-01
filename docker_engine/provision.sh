#!/usr/bin/env bash


ONET_VERSION=23_1
DB_URL=http://backend-web/db_${ONET_VERSION}_mysql.zip
OE_URL=http://backend-web/
PROJECT_ROOT=/home/vagrant/econ_data

echo "econ_data-eng" > /etc/hostname
hostname -F /etc/hostname
echo "10.10.10.11   backend-web" >> /etc/hosts
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
OLD_WD=`pwd`
echo $OLD_WD
cd ${PROJECT_ROOT}/tempdata/
for f in *.sql; do mv "$f" "AA$f"; done
cd $OLD_WD
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
#mysql -u root -p$db_passwd < bls_oe_data_import.sql
docker run --name econ_data -e POSTGRES_PASSWORD=password -v ${PROJECT_ROOT}/tempdata:/docker-entrypoint-initdb.d -d postgres

# wait five minutes and then delte the tempdata
#sleep 300 && rm -rf ${PROJECT_ROOT}/tempdata/ & 
