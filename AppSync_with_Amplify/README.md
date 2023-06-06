# AppSync
This example uses an AppSync GraphQL API to front-end data query and manipulation in a DynamoDB table.

## Table Creation
This example requires a DynamoDB table.  The 1_create_table.py script can be used to create the table.
```
$ python3 1_create_table.py 

> Current tables
    CarsNE1
    Olympics
    TestGlobal
    people
    student

> Creating table
    Created table ARN: arn:aws:dynamodb:us-east-2:146868985163:table/AppSyncTest

> Waiting for table state: ACTIVE
    Check 0: CREATING
    Check 1: CREATING
    Check 2: CREATING
    Check 3: CREATING
    Check 4: CREATING
    Check 5: ACTIVE

> Inserting 1 item into AppSyncTest
    The item:
    {"id": {"N": "1"}, "make": {"S": "Mazda"}, "model": {"S": "RX-7"}, "year": {"N": "1982"}}

> Scanning table for count
    1 item(s) in the new table:
    {"model": {"S": "RX-7"}, "year": {"N": "1982"}, "id": {"N": "1"}, "make": {"S": "Mazda"}}

$
```



## Amplify Installation
```
$ sudo npm install -g @aws-amplify/cli
Password:

added 26 packages in 54s
```

## Amplify Init
```
$ amplify init
Note: It is recommended to run this command from the root of your app directory
? Enter a name for the project app
The following configuration will be applied:

Project information
| Name: app
| Environment: dev
| Default editor: Visual Studio Code
| App type: javascript
| Javascript framework: none
| Source Directory Path: src
| Distribution Directory Path: dist
| Build Command: npm run-script build
| Start Command: npm run-script start

? Initialize the project with the above configuration? Yes
Using default provider  awscloudformation
? Select the authentication method you want to use: AWS access keys
? accessKeyId:  ********************
? secretAccessKey:  ****************************************
? region:  us-east-2
Adding backend environment dev to AWS Amplify app: d3b9q5l4d51am

Deployment completed.
Deploying root stack app [ ---------------------------------------- ] 0/4
	amplify-app-dev-203258         AWS::CloudFormation::Stack     CREATE_IN_PROGRESS             Mon Jun 05 2023 20:33:02…
	AuthRole                       AWS::IAM::Role                 CREATE_IN_PROGRESS             Mon Jun 05 2023 20:33:04…
	DeploymentBucket               AWS::S3::Bucket                CREATE_IN_PROGRESS             Mon Jun 05 2023 20:33:05…
	UnauthRole                     AWS::IAM::Role                 CREATE_IN_PROGRESS             Mon Jun 05 2023 20:33:05…

✔ Help improve Amplify CLI by sharing non sensitive configurations on failures (y/N) · no
Deployment state saved successfully.
✔ Initialized provider successfully.
✅ Initialized your environment successfully.

Your project has been successfully initialized and connected to the cloud!

Some next steps:
"amplify status" will show you what you've added already and if it's locally configured or deployed
"amplify add <category>" will allow you to add features like user login or a backend API
"amplify push" will build all your local backend resources and provision it in the cloud
"amplify console" to open the Amplify Console and view your project status
"amplify publish" will build all your local backend and frontend resources (if you have hosting category added) and provision it in the cloud

Pro tip:
Try "amplify add api" to create a backend API and then "amplify push" to deploy everything
$
```


## Amplify Add API
```
$  amplify add codegen --apiId d6yopjippzbhjnrvhinp4xyely
✔ Getting API details
Browserslist: caniuse-lite is outdated. Please run:
  npx update-browserslist-db@latest
  Why you should do it regularly: https://github.com/browserslist/update-db#readme
Successfully added API TestAPI to your Amplify project
? Choose the code generation language target javascript
? Enter the file name pattern of graphql queries, mutations and subscriptions src/graphql/**/*.js
? Do you want to generate/update all possible GraphQL operations - queries, mutations and subscriptions Yes
? Enter maximum statement depth [increase from default if your schema is deeply nested] 2
✔ Downloaded the schema
✔ Generated GraphQL operations successfully and saved at src/graphql
$
```


## Amplify Codegen
```
Mac-2:app nick$  amplify codegen
✔ Downloaded the schema
✔ Generated GraphQL operations successfully and saved at src/graphql
Mac-2:app nick$
```
