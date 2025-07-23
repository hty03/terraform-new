
resource "aws_db_instance" "main" {
  identifier              = "main-db"
  allocated_storage       = 20
  engine                  = var.rds_engine
  engine_version          = var.rds_engine_version
  instance_class          = var.rds_instance_class
  username                = var.rds_username
  password                = var.rds_password
  db_name                 = var.rds_db_name
  skip_final_snapshot     = true
  publicly_accessible     = false
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]
  db_subnet_group_name    = aws_db_subnet_group.main.name
  storage_encrypted       = true
  kms_key_id              = var.kms_key_arn
}
