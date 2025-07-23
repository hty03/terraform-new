variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

variable "db_subnet_cidrs" {
  description = "List of CIDR blocks for DB subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of AZs to use"
  type        = list(string)
}

variable "flow_logs_bucket_arn" {
  description = "ARN of the S3 bucket to store VPC Flow Logs"
  type        = string
}
