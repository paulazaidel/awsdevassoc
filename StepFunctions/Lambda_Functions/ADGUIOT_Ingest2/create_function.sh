#!/bin/sh
#
# NOTE: You must edit the account number in the --role option
#
echo Packaging
zip ADGUIOT_Ingest2.zip ADGUIOT_Ingest2.mjs

# Create Function
echo "Create Function"
aws lambda create-function --function-name "ADGUIOT_Ingest2" --role "arn:aws:iam::146868985163:role/ADGUIOT_Lambda_Execution_Role" --zip-file "fileb://ADGUIOT_Ingest2.zip" --runtime "nodejs18.x" --handler "ADGUIOT_Ingest.handler" --tracing-config '{"Mode": "Active"}'

rm *.zip
