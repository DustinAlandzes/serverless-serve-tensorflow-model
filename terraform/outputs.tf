output "serverless_module_s3_bucket" {
  value       = aws_s3_bucket.serverless_module.bucket
  description = "The S3 bucket's name"
}

output "serverless_module_s3_bucket_url" {
  description = "The URL of the S3 bucket"
  value       = "https://${aws_s3_bucket.serverless_module.bucket.id}.s3.${aws_s3_bucket.serverless_module.bucket.region}.amazonaws.com/index.html"
}
