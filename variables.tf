variable "region" {
  default = "eu-west-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  default = "10.0.2.0/24"
}

variable "key_name" {
  description = "Name of the AWS Key Pair"
  default     = "flex-key-pair"
}

variable "instance_type" {
  default = "t3.medium"
}

variable "manager-server_instance_type" {
  default = "t2.micro"
}

variable "ami_id" {
  description = "Oracle Linux 8 AMI"
  default     = "ami-0cafee481e8a75ee3"
}
