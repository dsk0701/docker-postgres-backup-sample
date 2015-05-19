#! /bin/bash -e

# パラメータチェック
if [ -z $1 ] ; then
    echo "usage: $0 [backup-archive.tar.gz]"
    exit
fi

SHELL_DIR="${0%/*}"
RESTORE_ARCHIVE_FILE=$1
HOST_RESTORE_DIR="${SHELL_DIR}/restore"

mkdir -p ${HOST_RESTORE_DIR}

echo "cp ${RESTORE_ARCHIVE_FILE} restore/."
cp ${RESTORE_ARCHIVE_FILE} restore/.

# コンテナを捨ててクリーンな状態に立ち上げる
docker-compose stop
docker-compose rm --force
docker-compose up -d

