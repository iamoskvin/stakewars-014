#!/bin/bash

#you need to provide path to the backup .zip file that was generated with backup.sh script
BACKUPZIP=$1

DATADIR=/home/ansible/.nearbackup

sudo systemctl stop nearback.service

wait

echo "NEAR node was stopped" | ts

#remove data directory
rm -rf ${DATADIR}/data

#unzip full data directory
unzip $1  -d ${DATADIR}



sudo systemctl start nearback.service

echo "NEAR node was started" | ts
