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