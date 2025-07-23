variable "rds_engine" {
  description = "The database engine to use (e.g., mysql, postgres)"
  type        = string
  default     = "mysql"
}

variable "rds_engine_version" {
  description = "The version of the database engine"
  type        = string
  default     = "8.0.35"
}

variable "rds_instance_class" {
  description = "Instance class for the RDS instance"
  type        = string
  default     = "db.t3.medium"
}

variable "rds_username" {
  description = "Master username for RDS"
  type        = string
  default     = "admin"
}

variable "rds_password" {
  description = "Master password for RDS"
  type        = string
  sensitive   = true
}

variable "rds_db_name" {
  description = "Initial database name"
  type        = string
  default     = "mydb"
}

variable "kms_key_arn" {
  description = "ARN of the KMS key for encryption"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for the RDS security group"
  type        = string
}

variable "allowed_cidrs" {
  description = "List of CIDRs allowed to access the RDS instance"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "db_subnet_ids" {
  description = "List of subnet IDs for DB subnet group"
  type        = list(string)
}


