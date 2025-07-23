module "vpc" {
  source                  = "./modules/vpc"
  vpc_cidr                = "10.0.0.0/16"
  public_subnet_cidrs     = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs    = ["10.0.3.0/24", "10.0.4.0/24"]
  db_subnet_cidrs         = ["10.0.5.0/24", "10.0.6.0/24"]
  availability_zones      = ["ap-northeast-2a", "ap-northeast-2c"]
  flow_logs_bucket_arn    = module.s3.s3_logs_bucket_arn
}

module "eks" {
  source             = "./modules/eks"
  cluster_name       = "main-eks"
  cluster_version    = "1.29"
  subnet_ids         = module.vpc.private_subnet_ids
  eks_admin_iam_arn  = var.eks_admin_iam_arn

  node_instance_types = ["t3.medium"]
  desired_capacity     = 2
  min_size             = 1
  max_size             = 3
}

module "rds" {
  source              = "./modules/rds"
  rds_engine          = "mysql"
  rds_engine_version  = "8.0.35"
  rds_instance_class  = "db.t3.medium"
  rds_username        = "admin"
  rds_password        = var.rds_password
  rds_db_name         = "mydb"
  kms_key_arn         = "arn:aws:kms:ap-northeast-2:040108639270:key/your-kms-id"
  vpc_id         = module.vpc.vpc_id
  db_subnet_ids  = module.vpc.db_subnet_ids
  allowed_cidrs  = ["10.0.0.0/16"]  # 또는 실제 EKS 노드 서브넷 대역
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
