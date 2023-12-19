terraform {
  required_version = "~> 1.6.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "serverless_module" {
  bucket_prefix = "serverless-module"
}


resource "aws_s3_bucket_ownership_controls" "serverless_module" {
  bucket = aws_s3_bucket.serverless_module.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "serverless_module" {
  bucket = aws_s3_bucket.serverless_module.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "serverless_module" {
  depends_on = [
    aws_s3_bucket_ownership_controls.serverless_module,
    aws_s3_bucket_public_access_block.serverless_module
  ]

  bucket = aws_s3_bucket.serverless_module.id
  acl    = "public-read"
}

resource "aws_s3_bucket_website_configuration" "serverless_module" {
  bucket = aws_s3_bucket.serverless_module.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

locals {
  s3_origin_id = "myS3Origin"
}

resource "aws_cloudfront_distribution" "s3_bucket_cloudfront_distribution" {
  origin {
    domain_name = aws_s3_bucket.serverless_module.bucket_regional_domain_name
    origin_id   = local.s3_origin_id
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"


  default_cache_behavior {
    allowed_methods  = ["GET", "POST"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  price_class = "PriceClass_100"

  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = ["US", "CA", "GB", "DE"]
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}

resource "aws_iam_user" "serverless_module" {
  name = "serverless-module-s3-bucket-user"
}

resource "aws_iam_access_key" "serverless_module" {
  user = aws_iam_user.serverless_module.name
}

resource "aws_iam_user_policy" "serverless_module" {
  name = "serverless_module-s3-bucket-user-policy"
  user = aws_iam_user.serverless_module.name

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        Effect : "Allow",
        Action : [
          "s3:ListBucket",
          "s3:GetBucketLocation",
          "s3:GetObject",
          "s3:GetObjectAcl",
          "s3:DeleteObject",
          "s3:DeleteObjectVersion",
          "s3:PutObject",
          "s3:PutObjectAcl"
        ]
        Resource = [
          aws_s3_bucket.serverless_module.arn,
          "${aws_s3_bucket.serverless_module.arn}/*",
        ]
      }
    ]
  })
}