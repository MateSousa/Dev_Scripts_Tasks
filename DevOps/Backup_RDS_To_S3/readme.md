# Backup RDS to S3

This is a simple script to backup RDS to S3. It is based on the AWS CLI and the AWS CLI is required to be installed and configured on the machine that is running the script.

The script is designed to be run as a scheduled task on a ubuntu machine. It is designed to be run on a daily basis.

## TODO
- [] Add a check to see if the backup is already running
- [] Add a check to see if the backup is already in S3
- [x] Add delete of old backups

## Requirements
- AWS CLI
- AWS IAM account with access to the S3 bucket
- AWS IAM account with access to the RDS instance
- Ubuntu machine
- Cronjob or scheduled task to run the script

## Usage
- Copy the script to the machine that will run the backup
- Edit the script and change the variables at the top of the script
- Add the script to a scheduled task

## Variables
- `DB_USER` - The user that will be used to connect to the database
- `DB_PASSWORD` - The password for the user that will be used to connect to the database
- `DB_HOST` - The host of the database
- `DB_NAME` - The name of the database
- `S3_BUCKET` - The name of the S3 bucket that the backup will be uploaded to
- `BACKUPROOT` - The root directory that the backup will be stored in
- `AWS_ACCESS_KEY_ID` - The AWS access key id
- `AWS_SECRET_ACCESS_KEY` - The AWS secret access key	

## Notes
- I advise you to create an AWS IAM account to have your own access key and secret key for the backup