#------------------------
# S3 BUCKET
#------------------------

resource "random_string" "for_s3" {
  length  = 16
  lower   = true
  upper   = false
  numeric = true
  special = false
}

resource "aws_s3_bucket" "s3-media-wiki" {
  bucket = "media-wiki-${random_string.for_s3.id}"
  tags = {
    Name        = "mediawiki"
    Environment = "lab"
  }
}

resource "aws_route_table" "rt_for_s3_vpce" {
  vpc_id = aws_vpc.main.id
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id          = aws_vpc.main.id
  service_name    = var.vpc_endpoint_4_s3
  route_table_ids = [aws_route_table.rt_for_s3_vpce.id]
  tags = {
    "Name" = "S3 for MediaWiki"
  }
}

resource "aws_vpc_endpoint_route_table_association" "s3_endpoint_association" {
  route_table_id  = aws_route_table.rt_for_s3_vpce.id
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
}


