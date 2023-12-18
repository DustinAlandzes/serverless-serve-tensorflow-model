# serverless-module
[![frontend-build-and-deploy](https://github.com/DustinAlandzes/serverless-module/actions/workflows/frontend.yml/badge.svg)](https://github.com/DustinAlandzes/serverless-module/actions/workflows/frontend.yml)
[![backend-build-and-test](https://github.com/DustinAlandzes/serverless-module/actions/workflows/backend.yml/badge.svg)](https://github.com/DustinAlandzes/serverless-module/actions/workflows/backend.yml)
[![Terraform linting](https://github.com/DustinAlandzes/serverless-module/actions/workflows/terraform-linting.yml/badge.svg)](https://github.com/DustinAlandzes/serverless-module/actions/workflows/terraform-linting.yml)


AWS Serverless module using Terraform, a React/TypeScript frontend hosted on S3, and a Chalice/AWS Lambda backend.

## URLS
* frontend: http://serverless-module20231216202918611500000001.s3-website-us-west-2.amazonaws.com/
* backend: https://9komogf4ce.execute-api.us-west-2.amazonaws.com/api/graphql

## Terraform
* Terraform Cloud
* S3 Bucket, IAM User to access the bucket
* AWS Lambda config generated with chalice

## Frontend
* Vite, React, TypeScript
* Mantine
* React Router
* S3

## Backend
* Python 3
* Black, pytest
* Chalice, AWS Lambda
* Strawberry, GraphQL