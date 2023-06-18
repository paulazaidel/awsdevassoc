#!/bin/sh


echo ">>>>>   Getting queue url into variable"
url=`aws sqs list-queues --queue-name adguiot-ingest | jq ".QueueUrls[0]" | sed 's/"//g'`
echo "URL:  $url"

echo ">>>>>   aws sqs delete-queue --queue-url $url"
aws sqs delete-queue --queue-url $url
