#!/usr/bin/env bash


echo "Please enter mysql password for root: "
stty -echo
read db_passwd
stty echo


mkdir -p download.bls.gov/pub/time.series/oe
wget --no-parent --recursive  --reject oe.data.0.Current http://download.bls.gov/pub/time.series/oe/

mysql -u root -p$db_passwd < bls_oe_create_tables.sql
mysql -u root -p$db_passwd < bls_oe_data_import.sql

rm -rf download.bls.gov





