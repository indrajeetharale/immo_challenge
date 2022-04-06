#postgre sql

resource "aws_db_instance" "postgres" {
  identifier                = "postgres"
  allocated_storage         = 5
  backup_retention_period   = 2
  backup_window             = "01:00-01:30"
  maintenance_window        = "sun:03:00-sun:03:30"
  multi_az                  = true
  engine              		= "postgres"
  engine_version       		= "14.1"
  instance_class       		= "db.t4g.large"
  name                      = "rds_db"
  username                  = "postgres"
  password                  = "postgres"
  port                      = "5432"
  db_subnet_group_name      = aws_db_subnet_group.postgres-subnet-group.name
  vpc_security_group_ids    = [aws_security_group.rds_sg.id, aws_security_group.ecs_sg.id]
  skip_final_snapshot       = true
  final_snapshot_identifier = "worker-final"
  publicly_accessible       = true
}

