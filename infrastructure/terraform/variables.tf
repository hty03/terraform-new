
variable "region" {}
variable "profile" {}

variable "rds_password" {
  description = "Master password for RDS database"
  type        = string
  sensitive   = true
}

variable "eks_admin_iam_arn" {
  description = "IAM ARN for EKS admin access"
  type        = string
}
