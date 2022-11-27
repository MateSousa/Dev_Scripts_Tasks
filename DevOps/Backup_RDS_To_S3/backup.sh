#!/bin/bash

cd path/to/backup/directory
# Database credentials
DB_USER=
DB_HOST=
DB_NAME=
DB_PASSWORD=

#Backup_Directory_Locations
TSTAMP=$(date +"%d-%b-%Y-%H-%M-%S")
BACKUPROOT=
S3BUCKET="s3://my-bucket"
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=

#Dump of Mysql Database
mysqldump --no-tablespaces -h $DB_HOST -u $DB_USER  -p$DB_PASSWORD $DB_NAME > $backupfile

#Send to s3, using local path because of permissions issues and cronjob doesnt find aws cli in path
AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY /usr/local/bin/aws s3 cp  $BACKUPROOT $S3BUCKET

#Delete 7 days old backups
find $BACKUPROOT -mtime +7 -exec rm {} \;