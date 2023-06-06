#!/bin/sh
echo ">>>>>   Note: use 'amplify delete' from /tmp/amplify to delete all resources created in this demo."
echo

origwd=`pwd`
echo ">>>>>   Original working directory: " $origwd
echo

echo ">>>>>   Installing AWS Amplify CLI"
echo ">>>>>   sudo npm install -g @aws-amplify/cli"
sudo npm install -g @aws-amplify/cli
echo


echo "mkdir /tmp/amplify; cd /tmp/amplify"
mkdir /tmp/amplify
cd /tmp/amplify
echo

echo ">>>>>   amplify init"
amplify init
echo

echo ">>>>>   amplify add storage"
amplify add storage
echo

echo ">>>>>   amplify push"
amplify push
echo

echo ">>>>>   cp $origwd/app.js src/app.js"
cp $origwd/app.js src/app.js
echo

echo ">>>>>   cp $origwd/package.json ./package.json"
cp $origwd/package.json ./package.json
echo

echo ">>>>>   npm install"
npm install
echo



