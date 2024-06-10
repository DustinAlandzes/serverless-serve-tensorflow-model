# serverless-module
[![frontend-build-and-deploy](https://github.com/DustinAlandzes/serverless-serve-tensorflow-model/actions/workflows/frontend.yml/badge.svg)](https://github.com/DustinAlandzes/serverless-serve-tensorflow-model/actions/workflows/frontend.yml)
[![backend-build-and-test](https://github.com/DustinAlandzes/serverless-serve-tensorflow-model/actions/workflows/backend.yml/badge.svg)](https://github.com/DustinAlandzes/serverless-serve-tensorflow-model/actions/workflows/backend.yml)
[![Terraform linting](https://github.com/DustinAlandzes/serverless-serve-tensorflow-model/actions/workflows/terraform-linting.yml/badge.svg)](https://github.com/DustinAlandzes/serverless-serve-tensorflow-model/actions/workflows/terraform-linting.yml)


AWS Serverless module using Terraform, a React/TypeScript frontend hosted on S3, and a Chalice/AWS Lambda backend.

## Usage
1. Run generate-terraform-files.sh locally.
2. Set these secrets and environment variables to Github (Under Settings > Secrets and Variables > Actions)
  * Secrets
    * AWS_ACCESS_KEY_ID
    * AWS_SECRET_ACCESS_KEY
  * Environment
    * S3_BUCKET (from Terraform after first plan E.g. serverless-module20240609203937756000000001)
    * CLOUDFRONT_DISTRIBUTION_ID (from Terraform  after first plan E.g. E2SFWLWM546CEU)
    * VITE_BACKEND_GRAPHQL_ENDPOINT (from Terraform after first plan, add /graphql E.g.  https://e1qgaxcqtc.execute-api.us-west-2.amazonaws.com/api/graphql)

3. Connect this repository to a workspace in Terraform Cloud and run the plan. After that you should get LAMBDA_URL and S3_BUCKET as outputs. Add those to the github repository as secrets.
4. Set provider_arns of CognitoUserPoolAuthorizer in chalice to cognito_user_pool_arn from Terraform (arn:aws:cognito-idp:us-west-2:166242363699:userpool/us-west-2_YJ59HjYLm)
5. Set the frontend's userPoolId and clientId in pages/config.json to cognito_user_pool_id and cognito_user_pool_client_id from Terraform (E.g. us-west-2_YJ59HjYLm and 72nhtdg4i2noqu0ou2q0986ch0)
6. Now create a new pull request and merge it to deploy the frontend. You'll be able to access it from the cloudfront distribution url in the terraform output

## URLS
* frontend cloudfront distribution: https://d1envi61nk6uvp.cloudfront.net/
* frontend S3 Bucket: http://serverless-module20240609203937756000000001.s3-website-us-west-2.amazonaws.com/
* backend: https://e1qgaxcqtc.execute-api.us-west-2.amazonaws.com/api/graphql

## Terraform
* [Terraform Cloud](https://developer.hashicorp.com/terraform/cloud-docs)
* Cloudfront Distribution, S3 Bucket, IAM User to access the bucket
* AWS Lambda config generated with chalice behind an API Gateway

## Frontend
* [Vite](https://vitejs.dev/guide/), [React](https://react.dev/reference/react), [TypeScript](https://www.typescriptlang.org/docs/)
* [Mantine](https://mantine.dev/getting-started/)
* [React Router](https://reactrouter.com/en/main)
* [S3](https://docs.aws.amazon.com/AmazonS3/latest/userguide//Welcome.html)
* [Cloudfront](https://docs.aws.amazon.com/cloudfront/#lang/en_us) for HTTPS
* https://www.npmjs.com/package/@aws-sdk/client-cognito-identity-provider

## Backend
* [Python 3](https://docs.python.org/3/)
* [Black](https://black.readthedocs.io/en/stable/), [pytest](https://docs.pytest.org/en/7.4.x/)
* [Chalice](https://aws.github.io/chalice/index.html), [AWS Lambda](https://docs.aws.amazon.com/lambda/latest/dg/welcome.html)
* [Strawberry](https://strawberry.rocks/docs), GraphQL

## TODO
* Enable CORs
* Clean up login/signup experience and add log out button
* Serve a simple tensorflow model