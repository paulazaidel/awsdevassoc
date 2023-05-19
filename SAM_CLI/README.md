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
ubuntu@ip-172-31-6-69:~$
ubuntu@ip-172-31-6-69:~$
ubuntu@ip-172-31-6-69:~$
ubuntu@ip-172-31-6-69:~$ mkdir HW
ubuntu@ip-172-31-6-69:~$ cd HW
ubuntu@ip-172-31-6-69:~/HW$ sam init

	SAM CLI now collects telemetry to better understand customer needs.

	You can OPT OUT and disable telemetry collection by setting the
	environment variable SAM_CLI_TELEMETRY=0 in your shell.
	Thanks for your help!

	Learn More: https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-telemetry.html


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

Use the most popular runtime and package type? (Python and zip) [y/N]: N

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

Would you like to enable X-Ray tracing on the function(s) in your application?  [y/N]: y
X-Ray will incur an additional cost. View https://aws.amazon.com/xray/pricing/ for more details

Would you like to enable monitoring using CloudWatch Application Insights?
For more info, please view https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch-application-insights.html [y/N]:

Project name [sam-app]:

Cloning from https://github.com/aws/aws-sam-cli-app-templates (process may take a moment)

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

ubuntu@ip-172-31-6-69:~/HW$
```


## Create the Hello World App CI/CD Pipeline in AWS CodePipeline
```
ubuntu@ip-172-31-6-69:~/HW/sam-app$ sam pipeline init --bootstrap

sam pipeline init generates a pipeline configuration file that your CI/CD system
can use to deploy serverless applications using AWS SAM.
We will guide you through the process to bootstrap resources for each stage,
then walk through the details necessary for creating the pipeline config file.

Please ensure you are in the root folder of your SAM application before you begin.

Select a pipeline template to get started:
	1 - AWS Quick Start Pipeline Templates
	2 - Custom Pipeline Template Location
Choice: 1

Cloning from https://github.com/aws/aws-sam-cli-pipeline-init-templates.git (process may take a moment)
Select CI/CD system
	1 - Jenkins
	2 - GitLab CI/CD
	3 - GitHub Actions
	4 - Bitbucket Pipelines
	5 - AWS CodePipeline
Choice: 5
Which pipeline template would you like to use?
	1 - Two-stage pipeline
	2 - Two-stage pipeline with monorepo
Choice []: 1
You are using the 2-stage pipeline template.
 _________    _________
|         |  |         |
| Stage 1 |->| Stage 2 |
|_________|  |_________|

Checking for existing stages...

[!] None detected in this account.

Do you want to go through stage setup process now? If you choose no, you can still reference other bootstrapped resources. [Y/n]: State^UY

For each stage, we will ask for [1] stage definition, [2] account details, and [3]
reference application build resources in order to bootstrap these pipeline
resources.

We recommend using an individual AWS account profiles for each stage in your
pipeline. You can set these profiles up using aws configure or ~/.aws/credentials. See
[https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-getting-started-set-up-credentials.html].


Stage 1 Setup

[1] Stage definition
Enter a configuration name for this stage. This will be referenced later when you use the sam pipeline init command:
Stage configuration name: StageOne

[2] Account details
The following AWS credential sources are available to use.
To know more about configuration AWS credentials, visit the link below:
https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html
	1 - Environment variables (not available)
	2 - default (named profile)
	q - Quit and configure AWS credentials
Select a credential source to associate with this stage: 2
Associated account 146868985163 with configuration StageOne.

Enter the region in which you want these resources to be created [us-east-2]:
Enter the pipeline IAM user ARN if you have previously created one, or we will create one for you []:

[3] Reference application build resources
Enter the pipeline execution role ARN if you have previously created one, or we will create one for you []:
Enter the CloudFormation execution role ARN if you have previously created one, or we will create one for you []:
Please enter the artifact bucket ARN for your Lambda function. If you do not have a bucket, we will create one for you []:
Does your application contain any IMAGE type Lambda functions? [y/N]:

[4] Summary
Below is the summary of the answers:
	1 - Account: 146868985163
	2 - Stage configuration name: StageOne
	3 - Region: us-east-2
	4 - Pipeline user: [to be created]
	5 - Pipeline execution role: [to be created]
	6 - CloudFormation execution role: [to be created]
	7 - Artifacts bucket: [to be created]
	8 - ECR image repository: [skipped]
Press enter to confirm the values above, or select an item to edit the value:

This will create the following required resources for the 'StageOne' configuration:
	- Pipeline IAM user
	- Pipeline execution role
	- CloudFormation execution role
	- Artifact bucket
Should we proceed with the creation? [y/N]: y
	Creating the required resources...
	Successfully created!
The following resources were created in your account:
	- Pipeline execution role
	- CloudFormation execution role
	- Artifact bucket
	- Pipeline IAM user
Pipeline IAM user credential:
	AWS_ACCESS_KEY_ID: AKIASEMQS3VFRJRSCBSV
	AWS_SECRET_ACCESS_KEY: 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
View the definition in .aws-sam/pipeline/pipelineconfig.toml,
run sam pipeline bootstrap to generate another set of resources, or proceed to
sam pipeline init to create your pipeline configuration file.

Before running sam pipeline init, we recommend first setting up AWS credentials
in your CI/CD account. Read more about how to do so with your provider in
https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-generating-example-ci-cd-others.html.

Checking for existing stages...

Only 1 stage(s) were detected, fewer than what the template requires: 2. If these are incorrect, delete .aws-sam/pipeline/pipelineconfig.toml and rerun

Do you want to go through stage setup process now? If you choose no, you can still reference other bootstrapped resources. [Y/n]:

For each stage, we will ask for [1] stage definition, [2] account details, and [3]
reference application build resources in order to bootstrap these pipeline
resources.

We recommend using an individual AWS account profiles for each stage in your
pipeline. You can set these profiles up using aws configure or ~/.aws/credentials. See
[https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-getting-started-set-up-credentials.html].


Stage 2 Setup

[1] Stage definition
Enter a configuration name for this stage. This will be referenced later when you use the sam pipeline init command:
Stage configuration name: StageTwo

[2] Account details
The following AWS credential sources are available to use.
To know more about configuration AWS credentials, visit the link below:
https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html
	1 - Environment variables (not available)
	2 - default (named profile)
	q - Quit and configure AWS credentials
Select a credential source to associate with this stage: 2
Associated account 146868985163 with configuration StageTwo.

Enter the region in which you want these resources to be created [us-east-2]:
Pipeline IAM user ARN: arn:aws:iam::146868985163:user/aws-sam-cli-managed-StageOne-pipeline-PipelineUser-SYJJ0A5HQJ7I

[3] Reference application build resources
Enter the pipeline execution role ARN if you have previously created one, or we will create one for you []:
Enter the CloudFormation execution role ARN if you have previously created one, or we will create one for you []:
Please enter the artifact bucket ARN for your Lambda function. If you do not have a bucket, we will create one for you []:
Does your application contain any IMAGE type Lambda functions? [y/N]:

[4] Summary
Below is the summary of the answers:
	1 - Account: 146868985163
	2 - Stage configuration name: StageTwo
	3 - Region: us-east-2
	4 - Pipeline user ARN: arn:aws:iam::146868985163:user/aws-sam-cli-managed-StageOne-pipeline-PipelineUser-SYJJ0A5HQJ7I
	5 - Pipeline execution role: [to be created]
	6 - CloudFormation execution role: [to be created]
	7 - Artifacts bucket: [to be created]
	8 - ECR image repository: [skipped]
Press enter to confirm the values above, or select an item to edit the value:

This will create the following required resources for the 'StageTwo' configuration:
	- Pipeline execution role
	- CloudFormation execution role
	- Artifact bucket
Should we proceed with the creation? [y/N]: y
	Creating the required resources...
	Successfully created!
The following resources were created in your account:
	- Pipeline execution role
	- CloudFormation execution role
	- Artifact bucket
View the definition in .aws-sam/pipeline/pipelineconfig.toml,
run sam pipeline bootstrap to generate another set of resources, or proceed to
sam pipeline init to create your pipeline configuration file.

Checking for existing stages...

2 stage(s) were detected, matching the template requirements. If these are incorrect, delete .aws-sam/pipeline/pipelineconfig.toml and rerun
What is the Git provider?
	1 - Bitbucket
	2 - CodeCommit
	3 - GitHub
	4 - GitHubEnterpriseServer
Choice []: 2
What is the CodeCommit repository name?: SAMTEST
What is the Git branch used for production deployments? [main]:
What is the template file path? [template.yaml]:
We use the stage configuration name to automatically retrieve the bootstrapped resources created when you ran `sam pipeline bootstrap`.

Here are the stage configuration names detected in .aws-sam/pipeline/pipelineconfig.toml:
	1 - StageOne
	2 - StageTwo
Select an index or enter the stage 1's configuration name (as provided during the bootstrapping): 1
What is the sam application stack name for stage 1? [sam-app]:
Stage 1 configured successfully, configuring stage 2.

Here are the stage configuration names detected in .aws-sam/pipeline/pipelineconfig.toml:
	1 - StageOne
	2 - StageTwo
Select an index or enter the stage 2's configuration name (as provided during the bootstrapping): 2
What is the sam application stack name for stage 2? [sam-app]:
Stage 2 configured successfully.

To deploy this template and connect to the main git branch, run this against the leading account:
`sam deploy -t codepipeline.yaml --stack-name <stack-name> --capabilities=CAPABILITY_IAM`.
SUMMARY
We will generate a pipeline config file based on the following information:
	What is the Git provider?: CodeCommit
	What is the CodeCommit repository name?: SAMTEST
	What is the Git branch used for production deployments?: main
	What is the template file path?: template.yaml
	Select an index or enter the stage 1's configuration name (as provided during the bootstrapping): 1
	What is the sam application stack name for stage 1?: sam-app
	What is the pipeline execution role ARN for stage 1?: arn:aws:iam::146868985163:role/aws-sam-cli-managed-StageOne-PipelineExecutionRole-QHC2NIJOSDXE
	What is the CloudFormation execution role ARN for stage 1?: arn:aws:iam::146868985163:role/aws-sam-cli-managed-Stage-CloudFormationExecutionR-1JUGTY7TLZFQ1
	What is the S3 bucket name for artifacts for stage 1?: aws-sam-cli-managed-stageone-pipe-artifactsbucket-1n09x20wkfivo
	What is the ECR repository URI for stage 1?:
	What is the AWS region for stage 1?: us-east-2
	Select an index or enter the stage 2's configuration name (as provided during the bootstrapping): 2
	What is the sam application stack name for stage 2?: sam-app
	What is the pipeline execution role ARN for stage 2?: arn:aws:iam::146868985163:role/aws-sam-cli-managed-StageTwo-PipelineExecutionRole-I7JR1G0WRT5C
	What is the CloudFormation execution role ARN for stage 2?: arn:aws:iam::146868985163:role/aws-sam-cli-managed-Stage-CloudFormationExecutionR-D7CAKDD0C2VV
	What is the S3 bucket name for artifacts for stage 2?: aws-sam-cli-managed-stagetwo-pipe-artifactsbucket-171zud9w4gjic
	What is the ECR repository URI for stage 2?:
	What is the AWS region for stage 2?: us-east-2
Successfully created the pipeline configuration file(s):
	- assume-role.sh
	- codepipeline.yaml
	- pipeline/buildspec_integration_test.yml
	- pipeline/buildspec_feature.yml
	- pipeline/buildspec_unit_test.yml
	- pipeline/buildspec_deploy.yml
	- pipeline/buildspec_build_package.yml
ubuntu@ip-172-31-6-69:~/HW/sam-app$

```

## Deploy the Hello World App
```
ubuntu@ip-172-31-6-69:~/HW/sam-app$ sam deploy
	Creating the required resources...
	Successfully created!

		Managed S3 bucket: aws-sam-cli-managed-default-samclisourcebucket-14ttmgidyodkr
		A different default S3 bucket can be set in samconfig.toml
		Or by specifying --s3-bucket explicitly.
	Uploading to 2fe1b850b01c4982cc05eca58bc01b05  1393 / 1393  (100.00%)

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

	Uploading to 949be361f161e3af312e1984e77d41b8.template  1224 / 1224  (100.00%)


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


Changeset created successfully. arn:aws:cloudformation:us-east-2:146868985163:changeSet/samcli-deploy1684523405/e4d96a8a-72cf-4c52-8b61-69d11a37171f


Previewing CloudFormation changeset before deployment
======================================================
Deploy this changeset? [y/N]: y

2023-05-19 19:10:22 - Waiting for stack create/update to complete

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
CREATE_IN_PROGRESS                   AWS::ApiGateway::Deployment          ServerlessRestApiDeployment47fc2d5   -
                                                                          f9d
CREATE_IN_PROGRESS                   AWS::Lambda::Permission              HelloWorldFunctionHelloWorldPermis   -
                                                                          sionProd
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
Value               arn:aws:iam::146868985163:role/sam-app-HelloWorldFunctionRole-1BSDU99TO6MLL

Key                 HelloWorldApi
Description         API Gateway endpoint URL for Prod stage for Hello World function
Value               https://71lzszp13i.execute-api.us-east-2.amazonaws.com/Prod/hello/

Key                 HelloWorldFunction
Description         Hello World Lambda Function ARN
Value               arn:aws:lambda:us-east-2:146868985163:function:sam-app-HelloWorldFunction-dd3vn8pMv8nm
---------------------------------------------------------------------------------------------------------------------------------------------------


Successfully created/updated stack - sam-app in us-east-2

ubuntu@ip-172-31-6-69:~/HW/sam-app$
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
