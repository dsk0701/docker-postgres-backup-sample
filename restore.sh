#!/bin/bash

RESTORE_DIR=/restore

# リストア用アーカイブファイルがなかったら何もしない
if [ ! -f ${RESTORE_DIR}/backup-* ];then
    echo "No restore file."
    return 0
fi

LATEST_RESTORE_FILE=`ls -lt ${RESTORE_DIR}/backup-* | head -n 1 | awk '{print $9}' | xargs basename`
: ${RESTORE_FILE_NAME:=${LATEST_RESTORE_FILE}}

echo "Start the restore."

echo "Clean up data directory."
rm -rf ${PGDATA}/*

echo "Restore data."
tar zxvf ${RESTORE_DIR}/${RESTORE_FILE_NAME} && \
mv ${RESTORE_DIR}/${RESTORE_FILE_NAME} ${RESTORE_DIR}/restored_${RESTORE_FILE_NAME}

echo "Finish the restore."

