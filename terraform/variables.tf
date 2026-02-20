variable "bucket_name" {
  description = "The name of the S3 bucket to host the game"
  type        = string
  default     = "misael-hexgl-portfolio-2026"
}

variable "aws_region" {
  type    = string
  default = "eu-north-1"
}