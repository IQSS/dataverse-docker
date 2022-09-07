#!/bin/bash
aws --endpoint-url https://<endpoint> s3api list-objects-v2 --bucket <bucketName< --region oslo
