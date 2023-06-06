import { Amplify, Storage, Auth } from 'aws-amplify';
import awsconfig from './aws-exports.js';
import * as AWS from "aws-sdk";
Amplify.configure(awsconfig);

var username = "nick";
var password = "password";

async function listFiles() {
  Storage.list('') 
    .then(({ results }) => console.log("S3 List Files results: " + JSON.stringify(results)))
    .catch((err) => console.log(err));
}

async function signIn() {
  try {
    const user = await Auth.signIn(username, password);
    //const completed = await Auth.completeNewPassword(user, password)
    //console.log(completed);
    return user;
  } catch (error) {
    console.log('error signing in', error);
  }
}


var user = await signIn();
if (user) {
  console.log(">>>>>   User signIn result:");
  console.log(user);
  var creds = await Auth.currentUserCredentials();
  console.log(creds);
  //AWS.default.config.credentials = creds;
  console.log(JSON.stringify(AWS.default.config.credentials));

  await listFiles();
}
