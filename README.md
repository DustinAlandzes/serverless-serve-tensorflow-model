# serverless-module
[![frontend-build-and-deploy](https://github.com/DustinAlandzes/serverless-serve-tensorflow-model/actions/workflows/frontend.yml/badge.svg)](https://github.com/DustinAlandzes/serverless-serve-tensorflow-model/actions/workflows/frontend.yml)
[![backend-build-and-test](https://github.com/DustinAlandzes/serverless-serve-tensorflow-model/actions/workflows/backend.yml/badge.svg)](https://github.com/DustinAlandzes/serverless-serve-tensorflow-model/actions/workflows/backend.yml)
[![Terraform linting](https://github.com/DustinAlandzes/serverless-serve-tensorflow-model/actions/workflows/terraform-linting.yml/badge.svg)](https://github.com/DustinAlandzes/serverless-serve-tensorflow-model/actions/workflows/terraform-linting.yml)


AWS Serverless module using Terraform, a React/TypeScript frontend hosted on S3, and a Chalice/AWS Lambda backend.

## Usage
Set these secrets and environment variables in Github (Under Settings > Secrets and Variables > Actions)
* Environment Variables
  * S3_BUCKET
  * VITE_BACKEND_GRAPHQL_ENDPOINT
* Secrets (https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html)
  * AWS_ACCESS_KEY_ID
  * AWS_SECRET_ACCESS_KEY
  * LAMBDA_URL (From Terraform)
  * S3_BUCKET (From Terraform)

## URLS
* frontend cloudfront distribution: https://d3ibzyj917g42s.cloudfront.net/
* frontend S3 Bucket: http://serverless-module20231216202918611500000001.s3-website-us-west-2.amazonaws.com/
* backend: https://9komogf4ce.execute-api.us-west-2.amazonaws.com/api/graphql

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

## Backend
* [Python 3](https://docs.python.org/3/)
* [Black](https://black.readthedocs.io/en/stable/), [pytest](https://docs.pytest.org/en/7.4.x/)
* [Chalice](https://aws.github.io/chalice/index.html), [AWS Lambda](https://docs.aws.amazon.com/lambda/latest/dg/welcome.html)
* [Strawberry](https://strawberry.rocks/docs), GraphQL

## TODO
* Add AWS Cognito for accessing the API from the frontend
  * https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool
  * https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools.html
  * 