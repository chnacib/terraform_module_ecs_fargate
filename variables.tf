variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS Region"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR"
}

variable "public_subnet_1_cidr" {
  type        = string
  description = "Public subnet az1 CIDR"
}

variable "public_subnet_2_cidr" {
  type        = string
  description = "Public subnet az2 CIDR"
}

variable "public_subnet_3_cidr" {
  type        = string
  description = "Public subnet az3 CIDR"
}


variable "private_subnet_1_cidr" {
  type        = string
  description = "Private subnet az1 CIDR"
}

variable "private_subnet_2_cidr" {
  type        = string
  description = "Private subnet az2 CIDR"
}

variable "private_subnet_3_cidr" {
  type        = string
  description = "Private subnet az3 CIDR"
}

variable "ecs_cluster_name" {
  type        = string
  description = "ECS Cluster name"
}

variable "ecs_service_name" {
  type        = string
  description = "ECS service name"
}

variable "task_name" {
  type        = string
  description = "ECS Task definition name"
}

variable "ecr_name" {
  type        = string
  description = "ECR repository name"

}

variable "proj_name" {
  type        = string
  description = "Project name"

}

variable "container_port" {
  type        = number
  description = "Container port"

}

variable "service_desired_count" {
  type        = number
  description = "Service desired count"

}

variable "container_name" {
  type        = string
  description = "Container name"

}

variable "log_retention_days" {
  type        = number
  default     = 7
  description = "Cloudwatch logs retention days"

}

variable "fargate_cpu" {
  type        = number
  description = "Task definition CPU"

}

variable "fargate_memory" {
  type        = number
  description = "Task definition Memory"
}

variable "environment" {
  type        = any
  description = "Container environment variable"

}