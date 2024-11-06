output "vpc_arn" {
  value = aws_vpc.main.arn
}

output "rds_endpoint" {
  value = aws_db_instance.db_instance.endpoint
}

output "rds_password" {
  value     = aws_db_instance.db_instance.password
  sensitive = true
}

output "mediawiki_alb" {
  value = aws_lb.mediawiki_alb.dns_name
}

output "mediawiki_s3" {
  value = aws_s3_bucket.s3-media-wiki.bucket
}


