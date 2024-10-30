output "vpc_arn" {
  value = aws_vpc.main.arn
}

output "rds_endpoint" {
  value = aws_db_instance.db_instance.endpoint
}