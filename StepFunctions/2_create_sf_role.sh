#!/bin/sh
#
# NOTE: Replace acct (146...) with your AWS account #
#

acct="146868985163"


#Create Role
echo ">>>>>   Creating Role named: ADGUIOT_StepFunction_Role"
aws iam create-role --role-name "ADGUIOT_StepFunction_Role" --assume-role-policy-document '{ "Version": "2012-10-17", "Statement": [ { "Sid": "", "Effect": "Allow", "Principal": { "Service": "states.amazonaws.com" }, "Action": "sts:AssumeRole" } ] }' --description "Allow StepFunctions to call AWS services"
echo

# Attach Policy to new role
echo ">>>>>   Attaching policy ADGUIOT_StepFunction_Role to role ADGUIOT_StepFunction_Role"
aws iam attach-role-policy --role-name "ADGUIOT_StepFunction_Role" --policy-arn "arn:aws:iam::aws:policy/service-role/AWSLambdaRole"
echo
