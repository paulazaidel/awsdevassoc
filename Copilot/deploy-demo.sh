#!/bin/sh
echo ">>>>>   It is recommended to use copilot to delete after deploying this demo."
echo ">>>>>   Many resources are created with the one copilot command."
echo

echo ">>>>>   rm -rf demo-temp"
rm -rf demo-temp
echo

echo ">>>>>   mkdir demo-temp; cd demo-temp"
mkdir demo-temp; cd demo-temp

echo ">>>>>   git clone https://github.com/aws-samples/amazon-ecs-cli-sample-app.git demo-app"
git clone https://github.com/aws-samples/amazon-ecs-cli-sample-app.git demo-app 
echo

echo ">>>>>   cd demo-app"
cd demo-app
echo

echo ">>>>>   copilot init --app demo --name api --type 'Load Balanced Web Service' --dockerfile './Dockerfile' --port 80 --deploy"
copilot init --app demo --name api --type 'Load Balanced Web Service' --dockerfile './Dockerfile' --port 80 --deploy
echo
