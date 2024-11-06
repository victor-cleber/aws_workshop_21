#------------------------
# RDS INSTANCES
#------------------------
#------------------------
# MariaDB Wiki DB
#------------------------
# # create the rds instance
resource "aws_db_instance" "db_instance" {
  engine                 = "mariadb"
  engine_version         = "10.11.8"
  multi_az               = false
  identifier             = "rds-instance"
  username               = var.username
  password               = random_string.for_rds_password.id
  instance_class         = "db.t3.micro"
  allocated_storage      = 10
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.database_security_group.id]
  availability_zone      = data.aws_availability_zones.availability_zones.names[0]
  db_name                = "mediawikidb"
  skip_final_snapshot    = true
  publicly_accessible    = false
  deletion_protection    = false

  tags = {
    name = "TEST MariaDB"
  }
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name        = "db_subnets"
  subnet_ids  = [aws_subnet.db_subnet_a.id, aws_subnet.db_subnet_b.id]
  description = "subnets for database instance"

  tags = {
    Name = "database_subnets"
  }
}

resource "random_string" "for_rds_password" {
  length  = 10
  lower   = true
  upper   = false
  numeric = true
  special = false
}