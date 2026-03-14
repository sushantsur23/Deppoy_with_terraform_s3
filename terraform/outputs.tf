
output "website_endpoint" {
  description = "The endpoint of the S3 website."
  value       = aws_s3_bucket_website_configuration.website.website_endpoint
}
