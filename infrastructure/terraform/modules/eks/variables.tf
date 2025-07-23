variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version for EKS"
  type        = string
  default     = "1.29"
}

variable "subnet_ids" {
  description = "Subnets for the EKS cluster"
  type        = list(string)
}

variable "eks_admin_iam_arn" {
  description = "IAM user or role to grant cluster admin"
  type        = string
}

variable "node_group_name" {
  description = "EKS managed node group name"
  type        = string
  default     = "main-node-group-v2"
}

variable "node_instance_types" {
  description = "EC2 instance types for node group"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "desired_capacity" {
  description = "Desired capacity for node group"
  type        = number
  default     = 2
}

variable "min_size" {
  description = "Minimum number of nodes"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum number of nodes"
  type        = number
  default     = 3
}
