#!/bin/sh
#
# NOTE: Replace acct (146...) with your AWS account #
#

acct="146868985163"

# Detach Policy to new role
echo ">>>>>   Detaching policy AWSLambdaRole from role ADGUIOT_StepFunction_Role"
echo '>>>>>   aws iam detach-role-policy --role-name "ADGUIOT_StepFunction_Role" --policy-arn "arn:aws:iam::aws:policy/service-role/AWSLambdaRole"'
aws iam detach-role-policy --role-name "ADGUIOT_StepFunction_Role" --policy-arn "arn:aws:iam::aws:policy/service-role/AWSLambdaRole"
echo

#Delete Role
echo ">>>>>   Deleting Role named: ADGUIOT_StepFunction_Role"
echo '>>>>>   aws iam delete-role --role-name "ADGUIOT_StepFunction_Role"'
aws iam delete-role --role-name "ADGUIOT_StepFunction_Role"
