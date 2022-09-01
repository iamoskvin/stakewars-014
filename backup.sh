#!/bin/bash

#modified backup script: zipping + remove old backups 

DATE=$(date +%Y-%m-%d-%H-%M)
DATADIR=/home/ansible/.nearbackup/data
BACKUPDIR=/home/ansible/.nearbackup/backups


sudo systemctl stop nearback.service

wait

echo "NEAR node was stopped" | ts

echo "Backup started" | ts

#remove backups older than 3 days
find ${BACKUPDIR} -mtime +3 -type f -delete

zip -r ${BACKUPDIR}/near_${DATE}.zip $DATADIR

# Submit backup completion status, you can use healthchecks.io, betteruptime.com or other services
# Example
# curl -fsS -m 10 --retry 5 -o /dev/null https://hc-ping.com/xXXXxXXx-XxXx-XXXX-XXXx-...

sudo systemctl start nearback.service

echo "NEAR node was started" | ts
