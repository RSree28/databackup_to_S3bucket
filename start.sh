#!/bin/sh

echo "creating crontab"
echo "creating archive file..."
#Taking backup in tarformat of /data of host and placing it in /tmp of container
tar -zcvf /tmp/$BACKUP_NAME-`date "+%Y-%m-%d_%H-%M-%S"`.tar.gz /data
echo "uploading archive file to S3 bucket..."
aws s3 cp /tmp/*.tar.gz $S3_BUCKET_URL
echo "removing local archive..."
rm /tmp/*.tar.gz
echo "done."