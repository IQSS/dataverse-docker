#!/bin/bash
export PGPASSWORD=`cat /secrets/db/password`
cp -r /secrets/aws-cli/.aws ~


#file=10.21337/OZ4JBV/1869225dfbd-4edecc03da9e

files=`psql -U dataverse dataverse -h postgres  -f ${INIT_SCRIPTS_FOLDER}/cronjob/backupfiles.sql | grep S3 | awk '{split($0,a,"|"); print a[2]}' | sed "s/S3:\/\/$aws_bucket_name://"`
dump=`ls /data/databaseDumps/ -Art | tail -n 1`

aws s3 --endpoint https://$aws_endpoint cp /data/databaseDumps/$dump s3://$aws_bucket_name/databaseDumps

for  file in $files
	do 	
		if [ -f /data/$file ]; then
		echo "$file already copied" 
		else
			aws s3 --endpoint https://$aws_endpoint cp s3://$aws_bucket_name/$file  /data/$file
			echo "doneit" 
		fi

	done
#echo $files

#cp -r /secrets/aws-cli/.aws ~
#aws s3 --endpoint https://$aws_endpoint cp s3://$aws_bucket_name/$file  /data/$file
