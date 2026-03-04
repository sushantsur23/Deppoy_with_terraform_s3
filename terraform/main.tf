module "static_website" {
  source       = "../modules/s3-static-website"
  bucketname   = var.bucketname
  website_path = "../website"
}