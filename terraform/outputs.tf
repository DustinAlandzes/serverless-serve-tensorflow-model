output "serverless_module_s3_bucket" {
  value       = aws_s3_bucket.serverless_module.bucket
  description = "The S3 bucket's name"
}

output "aws_key" {
  value       = aws_iam_access_key.serverless_module.id
  description = "AWS key for IAM user"
}

output "aws_secret" {
  value       = aws_iam_access_key.serverless_module.secret
  description = "AWS secret for IAM user"
  sensitive   = true
}

output "cloudfront_domain" {
  value       = aws_cloudfront_distribution.s3_bucket_cloudfront_distribution.domain_name
  description = "Domain name of the cloudfront distribution"
}

output "cloudfront_id" {
  value       = aws_cloudfront_distribution.s3_bucket_cloudfront_distribution.id
  description = "ID of the cloudfront distribution (used to invalidate cache when updating frontend)"
}

output "cognito_user_pool_arn" {
  value       = aws_cognito_user_pool.pool.arn
  description = "Used as the provider_arns parameter of CognitoUserPoolAuthorizer in chalice."
}

output "cognito_user_pool_name" {
  value       = aws_cognito_user_pool.pool.name
  description = "Used as the name parameter of CognitoUserPoolAuthorizer in chalice."
}

output "cognito_user_pool_client_id" {
  value       = aws_cognito_user_pool_client.userpool_client.id
  description = "Used on the frontend client to login."
}

