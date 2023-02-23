
variable "region" {
  type        = string
  description = "AWS region to use"
}

variable "vpc_cidr_block" {
  type        = string
  description = "VPC CIDR block"
}

variable "profile" {
  type        = string
  description = "Profile to use for deployment"
}

variable "public_subnet_count" {
  type = number
}

variable "private_subnet_count" {
  type = number
}

variable "instance_type" {
  type    = string
  default = "t2.micro"

}

variable "instance_volume_size" {
  type    = number
  default = 50
}

variable "app_port" {
  type    = number
  default = 8000
}

variable "ami_id" {
  type = string
}

variable "instance_volume_type" {
  type    = string
  default = "gp2"
}

locals {
  public_subnets  = [for i in range(1, var.public_subnet_count + 1) : cidrsubnet(var.vpc_cidr_block, 8, i)]
  private_subnets = [for i in range(1, var.private_subnet_count + 1) : cidrsubnet(var.vpc_cidr_block, 8, i + var.private_subnet_count)]
}