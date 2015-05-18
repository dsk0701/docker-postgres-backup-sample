#! /bin/bash -e

CONTAINER_BACKUP_DATA_DIR=/var/lib/postgresql/data
CONTAINER_BACKUP_DIR=/backups
BACKUP_FILE_NAME=`date +"%Y%m%d_%H%M"`
HOST_BACKUP_DIR="$(pwd)/backup"

DB_SERVICE_NAME="postgres"
DB_CONTAINER_NAME=`docker-compose ps | grep ${DB_SERVICE_NAME} | awk '{print $1}'`

# コンテナを停止します。
echo "Stopping containers..."
docker-compose stop

# バックアップを行います。
docker run --rm --volumes-from ${DB_CONTAINER_NAME} -v ${HOST_BACKUP_DIR}:${CONTAINER_BACKUP_DIR} ubuntu tar zcvf ${CONTAINER_BACKUP_DIR}/backup-${BACKUP_FILE_NAME}.tar.gz ${CONTAINER_BACKUP_DATA_DIR}

# 4世代残しておく。
COUNT=0
ls -1t ${HOST_BACKUP_DIR}/backup-* | while read BACKUP_FILE
do
    if [ $COUNT -gt 3 ]; then
        echo "Remove old backup file:${BACKUP_FILE}"
        rm -f ${BACKUP_FILE}
    fi
    COUNT=$((COUNT + 1))
done

# コンテナを開始します。
echo "Starting containers..."
docker-compose start

