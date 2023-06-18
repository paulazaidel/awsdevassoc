#!/bin/sh
#
# NOTE: Replace acct (146...) with your AWS account #
#

acct="146868985163"

echo ">>>>>   Creating policy named: ADGUIOT_Lambda_Policy"
aws iam create-policy --policy-name "ADGUIOT_Lambda_Policy" --policy-document '{ "Version": "2012-10-17", "Statement": [ { "Sid": "VisualEditor0", "Effect": "Allow", "Action": [ "dynamodb:BatchGetItem", "dynamodb:PutItem", "dynamodb:DescribeTable", "dynamodb:DeleteItem", "dynamodb:GetItem", "dynamodb:Scan", "dynamodb:Query", "dynamodb:UpdateItem" ], "Resource": [ "arn:aws:dynamodb:us-west-1:'$acct':table/SoshulNetworkLive", "arn:aws:dynamodb:us-west-1:'$acct':table/SoshulNetworkLive/index/*" ] }, { "Sid": "VisualEditor1", "Effect": "Allow", "Action": [ "sqs:DeleteMessage", "ses:SendEmail", "logs:CreateLogStream", "sqs:GetQueueUrl", "xray:PutTelemetryRecords", "sqs:ReceiveMessage", "sqs:SendMessage", "sqs:GetQueueAttributes", "logs:CreateLogGroup", "logs:PutLogEvents", "cognito-idp:AdminGetUser", "xray:PutTraceSegments" ], "Resource": "*" } ] }'
echo



#Create Role
echo ">>>>>   Creating Role named: ADGUIOT_Lambda_Execution_Role"
aws iam create-role --role-name "ADGUIOT_Lambda_Execution_Role" --assume-role-policy-document '{ "Version": "2012-10-17", "Statement": [ { "Effect": "Allow", "Principal": { "Service": "lambda.amazonaws.com" }, "Action": "sts:AssumeRole" } ] }' --description "Allow Lambda to call AWS services for SoshulNetwork"
echo

# Attach Policy to new role
echo ">>>>>   Attaching policy ADGUIOT_Lambda_Policy to role ADGUIOT_Lambda_Execution_Role"
aws iam attach-role-policy --role-name "ADGUIOT_Lambda_Execution_Role" --policy-arn "arn:aws:iam::$acct:policy/ADGUIOT_Lambda_Policy"
echo
