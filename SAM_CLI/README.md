# AWS SAM CLI
Amazon Web Services Serverless Application Model Command Line Interface

## Installation
[https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/install-sam-cli.html](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/install-sam-cli.html)


### Installation example on Linux
```
ubuntu@ip-172-31-6-69:~$ wget https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip
--2023-05-19 18:52:06--  https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip
Resolving github.com (github.com)... 140.82.112.3
Connecting to github.com (github.com)|140.82.112.3|:443... connected.

<...output truncated...>

2023-05-19 18:52:07 (97.8 MB/s) - ‘aws-sam-cli-linux-x86_64.zip’ saved [67204334/67204334]

ubuntu@ip-172-31-6-69:~$ mkdir sam_cli

ubuntu@ip-172-31-6-69:~$ unzip aws-sam-cli-linux-x86_64.zip -d sam_cli/
Archive:  aws-sam-cli-linux-x86_64.zip
   creating: sam_cli/dist/
  inflating: sam_cli/dist/sam
  <...output truncated...>
  inflating: sam_cli/aws-sam-cli-src/setup.py
  inflating: sam_cli/aws-sam-cli-src/THIRD-PARTY-LICENSES

ubuntu@ip-172-31-6-69:~$ sudo ./sam_cli/install
You can now run: /usr/local/bin/sam --version

ubuntu@ip-172-31-6-69:~$ sam --version
SAM CLI, version 1.84.0

ubuntu@ip-172-31-6-69:~$
```



## Create SAM Hello World Project
```
ubuntu@ip-172-31-6-69:~/HW$ sam init

You can preselect a particular runtime or package type when using the `sam init` experience.
Call `sam init --help` to learn more.

Which template source would you like to use?
	1 - AWS Quick Start Templates
	2 - Custom Template Location
Choice: 1

Choose an AWS Quick Start application template
	1 - Hello World Example
	2 - Data processing
	3 - Hello World Example With Powertools
	4 - Multi-step workflow
	5 - Scheduled task
	6 - Standalone function
	7 - Serverless API
	8 - Infrastructure event management
	9 - Lambda Response Streaming
	10 - Serverless Connector Hello World Example
	11 - Multi-step workflow with Connectors
	12 - Lambda EFS example
	13 - DynamoDB Example
	14 - Machine Learning
Template: 1

Use the most popular runtime and package type? (Python and zip) [y/N]: n

Which runtime would you like to use?
	1 - aot.dotnet7 (provided.al2)
	2 - dotnet6
	3 - go1.x
	4 - go (provided.al2)
	5 - graalvm.java11 (provided.al2)
	6 - graalvm.java17 (provided.al2)
	7 - java17
	8 - java11
	9 - java8.al2
	10 - java8
	11 - nodejs18.x
	12 - nodejs16.x
	13 - nodejs14.x
	14 - nodejs12.x
	15 - python3.9
	16 - python3.8
	17 - python3.7
	18 - python3.10
	19 - ruby2.7
	20 - rust (provided.al2)
Runtime: 11

What package type would you like to use?
	1 - Zip
	2 - Image
Package type: 1

Based on your selections, the only dependency manager available is npm.
We will proceed copying the template using npm.

Select your starter template
	1 - Hello World Example
	2 - Hello World Example TypeScript
Template: 1

Would you like to enable X-Ray tracing on the function(s) in your application?  [y/N]:

Would you like to enable monitoring using CloudWatch Application Insights?
For more info, please view https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch-application-insights.html [y/N]:

Project name [sam-app]:

    -----------------------
    Generating application:
    -----------------------
    Name: sam-app
    Runtime: nodejs18.x
    Architectures: x86_64
    Dependency Manager: npm
    Application Template: hello-world
    Output Directory: .
    Configuration file: sam-app/samconfig.toml

    Next steps can be found in the README file at sam-app/README.md


Commands you can use next
=========================
[*] Create pipeline: cd sam-app && sam pipeline init --bootstrap
[*] Validate SAM template: cd sam-app && sam validate
[*] Test Function in the Cloud: cd sam-app && sam sync --stack-name {stack-name} --watch
```

## Deploy the Hello World App
```
ubuntu@ip-172-31-6-69:~/HW$ cd sam-app/
ubuntu@ip-172-31-6-69:~/HW/sam-app$ ls
README.md  events  hello-world  samconfig.toml  template.yaml
ubuntu@ip-172-31-6-69:~/HW/sam-app$ sam deploy

		Managed S3 bucket: aws-sam-cli-managed-default-samclisourcebucket-14ttmgidyodkr
		A different default S3 bucket can be set in samconfig.toml
		Or by specifying --s3-bucket explicitly.
File with same data already exists at 2fe1b850b01c4982cc05eca58bc01b05, skipping upload

	Deploying with following values
	===============================
	Stack name                   : sam-app
	Region                       : us-east-2
	Confirm changeset            : True
	Disable rollback             : False
	Deployment s3 bucket         : aws-sam-cli-managed-default-samclisourcebucket-14ttmgidyodkr
	Capabilities                 : ["CAPABILITY_IAM"]
	Parameter overrides          : {}
	Signing Profiles             : {}

Initiating deployment
=====================

	Uploading to 6930e4293d0f77b696155c25432ae8e7.template  1172 / 1172  (100.00%)


Waiting for changeset to be created..

CloudFormation stack changeset
-------------------------------------------------------------------------------------------------------------------------------------------------
Operation                            LogicalResourceId                    ResourceType                         Replacement
-------------------------------------------------------------------------------------------------------------------------------------------------
+ Add                                HelloWorldFunctionHelloWorldPermis   AWS::Lambda::Permission              N/A
                                     sionProd
+ Add                                HelloWorldFunctionRole               AWS::IAM::Role                       N/A
+ Add                                HelloWorldFunction                   AWS::Lambda::Function                N/A
+ Add                                ServerlessRestApiDeployment47fc2d5   AWS::ApiGateway::Deployment          N/A
                                     f9d
+ Add                                ServerlessRestApiProdStage           AWS::ApiGateway::Stage               N/A
+ Add                                ServerlessRestApi                    AWS::ApiGateway::RestApi             N/A
-------------------------------------------------------------------------------------------------------------------------------------------------


Changeset created successfully. arn:aws:cloudformation:us-east-2:146868985163:changeSet/samcli-deploy1684524230/52b7a4e2-c928-42ff-98a7-b85a98c9358f


Previewing CloudFormation changeset before deployment
======================================================
Deploy this changeset? [y/N]: y

2023-05-19 19:24:02 - Waiting for stack create/update to complete

CloudFormation events from stack operations (refresh every 5.0 seconds)
-------------------------------------------------------------------------------------------------------------------------------------------------
ResourceStatus                       ResourceType                         LogicalResourceId                    ResourceStatusReason
-------------------------------------------------------------------------------------------------------------------------------------------------
CREATE_IN_PROGRESS                   AWS::IAM::Role                       HelloWorldFunctionRole               -
CREATE_IN_PROGRESS                   AWS::IAM::Role                       HelloWorldFunctionRole               Resource creation Initiated
CREATE_COMPLETE                      AWS::IAM::Role                       HelloWorldFunctionRole               -
CREATE_IN_PROGRESS                   AWS::Lambda::Function                HelloWorldFunction                   -
CREATE_IN_PROGRESS                   AWS::Lambda::Function                HelloWorldFunction                   Resource creation Initiated
CREATE_COMPLETE                      AWS::Lambda::Function                HelloWorldFunction                   -
CREATE_IN_PROGRESS                   AWS::ApiGateway::RestApi             ServerlessRestApi                    -
CREATE_IN_PROGRESS                   AWS::ApiGateway::RestApi             ServerlessRestApi                    Resource creation Initiated
CREATE_COMPLETE                      AWS::ApiGateway::RestApi             ServerlessRestApi                    -
CREATE_IN_PROGRESS                   AWS::Lambda::Permission              HelloWorldFunctionHelloWorldPermis   -
                                                                          sionProd
CREATE_IN_PROGRESS                   AWS::ApiGateway::Deployment          ServerlessRestApiDeployment47fc2d5   -
                                                                          f9d
CREATE_IN_PROGRESS                   AWS::Lambda::Permission              HelloWorldFunctionHelloWorldPermis   Resource creation Initiated
                                                                          sionProd
CREATE_IN_PROGRESS                   AWS::ApiGateway::Deployment          ServerlessRestApiDeployment47fc2d5   Resource creation Initiated
                                                                          f9d
CREATE_COMPLETE                      AWS::ApiGateway::Deployment          ServerlessRestApiDeployment47fc2d5   -
                                                                          f9d
CREATE_IN_PROGRESS                   AWS::ApiGateway::Stage               ServerlessRestApiProdStage           -
CREATE_IN_PROGRESS                   AWS::ApiGateway::Stage               ServerlessRestApiProdStage           Resource creation Initiated
CREATE_COMPLETE                      AWS::ApiGateway::Stage               ServerlessRestApiProdStage           -
CREATE_COMPLETE                      AWS::Lambda::Permission              HelloWorldFunctionHelloWorldPermis   -
                                                                          sionProd
CREATE_COMPLETE                      AWS::CloudFormation::Stack           sam-app                              -
-------------------------------------------------------------------------------------------------------------------------------------------------

CloudFormation outputs from deployed stack
---------------------------------------------------------------------------------------------------------------------------------------------------
Outputs
---------------------------------------------------------------------------------------------------------------------------------------------------
Key                 HelloWorldFunctionIamRole
Description         Implicit IAM Role created for Hello World function
Value               arn:aws:iam::146868985163:role/sam-app-HelloWorldFunctionRole-1EX8K8BPSVOYQ

Key                 HelloWorldApi
Description         API Gateway endpoint URL for Prod stage for Hello World function
Value               https://f3xl1nrx8e.execute-api.us-east-2.amazonaws.com/Prod/hello/

Key                 HelloWorldFunction
Description         Hello World Lambda Function ARN
Value               arn:aws:lambda:us-east-2:146868985163:function:sam-app-HelloWorldFunction-y3p8SgNMbtPx
---------------------------------------------------------------------------------------------------------------------------------------------------


Successfully created/updated stack - sam-app in us-east-2
```

## The Code SAM Deployed
```
/**
 *
 * Event doc: https://docs.aws.amazon.com/apigateway/latest/developerguide/set-up-lambda-proxy-integrations.html#api-gateway-simple-proxy-for-lambda-input-format
 * @param {Object} event - API Gateway Lambda Proxy Input Format
 *
 * Context doc: https://docs.aws.amazon.com/lambda/latest/dg/nodejs-prog-model-context.html
 * @param {Object} context
 *
 * Return doc: https://docs.aws.amazon.com/apigateway/latest/developerguide/set-up-lambda-proxy-integrations.html
 * @returns {Object} object - API Gateway Lambda Proxy Output Format
 *
 */

export const lambdaHandler = async (event, context) => {
    try {
        return {
            'statusCode': 200,
            'body': JSON.stringify({
                message: 'hello world',
            })
        }
    } catch (err) {
        console.log(err);
        return err;
    }
};
```


## Modify hello-world/app.mjs and redeploy
```
ubuntu@ip-172-31-6-69:~/HW/sam-app$ cd hello-world/
ubuntu@ip-172-31-6-69:~/HW/sam-app/hello-world$ vi app.mjs
ubuntu@ip-172-31-6-69:~/HW/sam-app/hello-world$ cd ..
ubuntu@ip-172-31-6-69:~/HW/sam-app$ sam deploy

		Managed S3 bucket: aws-sam-cli-managed-default-samclisourcebucket-14ttmgidyodkr
		A different default S3 bucket can be set in samconfig.toml
		Or by specifying --s3-bucket explicitly.
	Uploading to e63da538f67fd8226fcb768c941b1eeb  1393 / 1393  (100.00%)

	Deploying with following values
	===============================
	Stack name                   : sam-app
	Region                       : us-east-2
	Confirm changeset            : True
	Disable rollback             : False
	Deployment s3 bucket         : aws-sam-cli-managed-default-samclisourcebucket-14ttmgidyodkr
	Capabilities                 : ["CAPABILITY_IAM"]
	Parameter overrides          : {}
	Signing Profiles             : {}

Initiating deployment
=====================

	Uploading to 664d2867bb33b8a23eccbc33227558f1.template  1172 / 1172  (100.00%)


Waiting for changeset to be created..

CloudFormation stack changeset
-------------------------------------------------------------------------------------------------------------------------------------------------
Operation                            LogicalResourceId                    ResourceType                         Replacement
-------------------------------------------------------------------------------------------------------------------------------------------------
* Modify                             HelloWorldFunction                   AWS::Lambda::Function                False
* Modify                             ServerlessRestApi                    AWS::ApiGateway::RestApi             False
-------------------------------------------------------------------------------------------------------------------------------------------------


Changeset created successfully. arn:aws:cloudformation:us-east-2:146868985163:changeSet/samcli-deploy1684524663/847ef294-2a84-4106-9e82-6f7a6e48fb5d


Previewing CloudFormation changeset before deployment
======================================================
Deploy this changeset? [y/N]: y

2023-05-19 19:31:33 - Waiting for stack create/update to complete

CloudFormation events from stack operations (refresh every 5.0 seconds)
-------------------------------------------------------------------------------------------------------------------------------------------------
ResourceStatus                       ResourceType                         LogicalResourceId                    ResourceStatusReason
-------------------------------------------------------------------------------------------------------------------------------------------------
UPDATE_IN_PROGRESS                   AWS::Lambda::Function                HelloWorldFunction                   -
UPDATE_COMPLETE                      AWS::Lambda::Function                HelloWorldFunction                   -
UPDATE_COMPLETE_CLEANUP_IN_PROGRES   AWS::CloudFormation::Stack           sam-app                              -
S
UPDATE_COMPLETE                      AWS::CloudFormation::Stack           sam-app                              -
-------------------------------------------------------------------------------------------------------------------------------------------------

CloudFormation outputs from deployed stack
---------------------------------------------------------------------------------------------------------------------------------------------------
Outputs
---------------------------------------------------------------------------------------------------------------------------------------------------
Key                 HelloWorldFunctionIamRole
Description         Implicit IAM Role created for Hello World function
Value               arn:aws:iam::146868985163:role/sam-app-HelloWorldFunctionRole-1EX8K8BPSVOYQ

Key                 HelloWorldApi
Description         API Gateway endpoint URL for Prod stage for Hello World function
Value               https://f3xl1nrx8e.execute-api.us-east-2.amazonaws.com/Prod/hello/

Key                 HelloWorldFunction
Description         Hello World Lambda Function ARN
Value               arn:aws:lambda:us-east-2:146868985163:function:sam-app-HelloWorldFunction-y3p8SgNMbtPx
---------------------------------------------------------------------------------------------------------------------------------------------------


Successfully created/updated stack - sam-app in us-east-2

ubuntu@ip-172-31-6-69:~/HW/sam-app$
```


## Delete SAM APP and associated resources
```
ubuntu@ip-172-31-6-69:~/HW/sam-app$ sam delete
	Are you sure you want to delete the stack sam-app in the region us-east-2 ? [y/N]: y
	Do you want to delete the template file 664d2867bb33b8a23eccbc33227558f1.template in S3? [y/N]: y
        - Deleting S3 object with key e63da538f67fd8226fcb768c941b1eeb
        - Deleting S3 object with key 664d2867bb33b8a23eccbc33227558f1.template
	- Deleting Cloudformation stack sam-app

Deleted successfully
ubuntu@ip-172-31-6-69:~/HW/sam-app$
```
