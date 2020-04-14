#!/bin/bash

if [ $# -lt 1 ]
then
 printf "\nWrong Usage: Not enough arguments.\nusage:\n./install_mongo.sh version_number \nTry 4.2 as version_number as of Fri, 14 Apr 2020 20:20:26 GMT\n\n\n"
 exit 1
fi

echo "Importing Monogo PGP for apt"

wget -qO - https://www.mongodb.org/static/pgp/server-$1.asc | sudo apt-key add -

echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/$1 main" | sudo tee /etc/apt/sources.list.d/mongodb-org.list

sudo apt update
echo "Installing mongodB"

sudo apt install -y mongodb-org

echo "Creating /data/db to store mongo data"

sudo mkdir /data/
sudo mkdir /data/db


exit 0
