variable "aws_region" {
  description = "AWS region for the practice environment."
  type        = string
  default     = "ap-northeast-1"
}

variable "project_name" {
  description = "Prefix used for resource names."
  type        = string
  default     = "terraform-practice"
}

variable "environment" {
  description = "Deployment environment."
  type        = string
  default     = "dev"
}

variable "db_username" {
  description = "PostgreSQL administrator username."
  type        = string
  default     = "postgres"
}

variable "db_password" {
  description = "PostgreSQL administrator password. Supply outside Git."
  type        = string
  sensitive   = true
}
