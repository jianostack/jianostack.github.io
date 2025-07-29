#! /bin/bash
# MySQL separate databases and all-databases. Then upload to Azure storage.

TIMESTAMP=$(date +"%F")
BACKUP_DIR="/home/user/dumps"
BACKUP_TIME="$BACKUP_DIR/$TIMESTAMP"
MYSQL_USER="dumper"
MYSQL=/usr/bin/mysql
MYSQL_PASSWORD="password"
MYSQLDUMP=/usr/bin/mysqldump
NODEJS=/usr/bin/nodejs
AZURE=/usr/local/bin/azure

export AZURE_STORAGE_ACCOUNT=
export AZURE_STORAGE_ACCESS_KEY=
export AZURE_CONTAINER=

echo 'start separate DB dumps'
mkdir -p "$BACKUP_TIME/mysql"

databases=`$MYSQL --user=$MYSQL_USER -p$MYSQL_PASSWORD -e "SHOW DATABASES;" | grep -Ev "(Database|information_schema|performance_schema)"`

for db in $databases; do
  $MYSQLDUMP --force --opt --user=$MYSQL_USER -p$MYSQL_PASSWORD --databases $db | gzip > "$BACKUP_TIME/mysql/$db.gz"
done

echo 'start --all-databases dump'
$MYSQLDUMP --all-databases > "$BACKUP_TIME/all-databases.sql"
gzip "$BACKUP_TIME/all-databases.sql"

echo 'zip all the dumps'
zip -r "$BACKUP_TIME.zip" $BACKUP_TIME

echo 'upload to azure storage'
$NODEJS $AZURE storage blob upload "$BACKUP_TIME.zip" $AZURE_CONTAINER "$TIMESTAMP.zip"

echo 'rm back up directory'
rm -rf $BACKUP_DIR