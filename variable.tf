variable "myvpc_id" {
  description = "The environment of the AWS infrastructure"
  type        = string
  default     = "vpc-0424f09862acfcf28"
}

variable "myregion_one" {
  description = "Region"
  type        = string
  default     = "us-east-1"
}

variable "myaz_one" {
  description = "Region"
  type        = string
  default     = "us-east-1a"
}

variable "mysubnet_id" {
  description = "The environment of the AWS infrastructure"
  type        = string
  default     = "subnet-07119db572a2f5f2a"
}

variable "env" {
  description = "The environment of the AWS infrastructure"
  type        = string
  default     = "dev"
}

variable "my_inst_type" {
  description = "The environment of the AWS infrastructure"
  type        = string
  default     = "t2.micro"
}
