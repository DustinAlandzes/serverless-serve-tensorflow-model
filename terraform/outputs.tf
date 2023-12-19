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
  value = aws_cloudfront_distribution.s3_bucket_cloudfront_distribution.domain_name
  description = "Domain name of the cloudfront distribution"
}