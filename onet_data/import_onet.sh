#!/bin/bash

ONET_VERSION=23_1
DB_URL=http://www.onetcenter.org/dl_files/database/db_${ONET_VERSION}_mysql.zip
wget $DB_URL
unzip db_${ONET_VERSION}_mysql.zip
# variables (db must exist)
db_name=onet_${ONET_VERSION}
FILES=./db_${ONET_VERSION}_mysql/*

echo "Please enter mysql password for root: "
stty -echo
read db_passwd
stty echo

for f in $FILES
do
  echo "Processing $f file..."
  # take action on each file. $f store current file name
  mysql -u root -p$db_passwd -D $db_name < $f
done

unset db_passwd

rm -rf ./db_${ONET_VERSION}_mysql/
rm -rf ./db_${ONET_VERSION}_mysql.zip
