#!/bin/bash

# variables (db must exist)
db_name=onet_20_2
FILES=/home/tmwsiy/PycharmProjects/econ_data/onet_data/db_20_2_mysql/*

echo "Please enter mysql password for root: "
stty -echo
read input_variable
stty echo

for f in $FILES
do
  echo "Processing $f file..."
  # take action on each file. $f store current file name
  mysql -u root -p$input_variable -D $db_name < $f
done
