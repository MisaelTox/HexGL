# AWS provider configuration
provider "aws" {
  region = var.aws_region
}

# S3 bucket for static game hosting
resource "aws_s3_bucket" "game_hosting" {
  bucket = var.bucket_name # Must be globally unique across all AWS accounts
}

# Configure the bucket as a static website
resource "aws_s3_bucket_website_configuration" "hosting_config" {
  bucket = aws_s3_bucket.game_hosting.id

  index_document {
    suffix = "index.html"
  }
}

# Allow public access (required for static website hosting)
resource "aws_s3_bucket_public_access_block" "public_block" {
  bucket = aws_s3_bucket.game_hosting.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "allow_public_read" {
  bucket = aws_s3_bucket.game_hosting.id

  # Must wait for public access block to be applied before attaching the policy
  depends_on = [aws_s3_bucket_public_access_block.public_block]

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.game_hosting.arn}/*"
      },
    ]
  })
}