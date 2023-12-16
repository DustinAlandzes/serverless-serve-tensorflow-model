output "serverless_module_s3_bucket" {
  value       = aws_s3_bucket.serverless_module.bucket
  description = "The S3 bucket's name"
}
