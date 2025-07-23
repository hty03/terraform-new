
module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = "10.0.0.0/16"
}

module "eks" {
  source = "./modules/eks"
  cluster_name = "my-eks"
  cluster_version = "1.29"
  cluster_role_arn = var.eks_admin_iam_arn
  subnet_ids = []
}

module "rds" {
  source = "./modules/rds"
  rds_engine = "mysql"
  rds_engine_version = "8.0.35"
  rds_instance_class = "db.t3.medium"
  rds_username = "admin"
  rds_password = var.rds_master_password
  rds_db_name = "mydb"
  kms_key_arn = "arn:aws:kms:ap-northeast-2:040108639270:key/your-rds-kms-key-id"
}

module "s3" {
  source = "./modules/s3"
  s3_logs_bucket_name = "my-logs-bucket-040108639270"
}

module "dynamodb" {
  source = "./modules/dynamodb"
  ddb_security_logs_table = "SecurityLogs"
}

module "security_log_collectors" {
  source = "./modules/security-log-collectors"
  cloudtrail_s3_bucket = "my-logs-bucket-040108639270"
}
