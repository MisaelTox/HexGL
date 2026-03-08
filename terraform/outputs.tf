output "game_url" {
  value       = aws_s3_bucket_website_configuration.hosting_config.website_endpoint
  description = "The URL of the hosted game"
}