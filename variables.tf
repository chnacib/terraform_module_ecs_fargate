variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS Region"
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnet_1_cidr" {
  type = string
}

variable "public_subnet_2_cidr" {
  type = string
}

variable "public_subnet_3_cidr" {
  type = string
}


variable "private_subnet_1_cidr" {
  type = string
}

variable "private_subnet_2_cidr" {
  type = string
}

variable "private_subnet_3_cidr" {
  type = string
}

variable "ecs_cluster_name" {
  type = string
}

variable "ecs_service_name" {
  type = string
}

variable "task_name" {
  type = string
}

variable "ecr_name" {
  type = string

}

variable "proj_name" {
  type = string

}

variable "container_port" {
  type = number

}

variable "service_desired_count" {
  type = number

}

variable "container_name" {
  type = string

}

variable "log_retention_days" {
  type    = number
  default = 0

}

variable "container_cpu" {
  type = number

}

variable "container_memory" {
  type = number

}

variable "fargate_cpu" {
  type = number

}

variable "fargate_memory" {
  type = number
}

variable "container_image" {
  type = string

}

variable "environment" {
  type = any

}