# Define variables using for VPC setup

variable "aws_region" {
  description = "AWS Default working region for iOPEX Cloud"
  default = "ap-south-1"
}

variable "access_key" {
  description = "Inesh Access Key for iOPEX Cloud"
  default = "AKIAJKSSQYZUMXNM3R3Q"
}

variable "secret_key" {
  description = "Inesh Secret Key for iOPEX Cloud"
  default = "1cpJ5rdvjDBXxgC7tIuJXmlnrFoGoeSUS9jdsscG"
}

variable "vpc_cidr" {
  description = "Default CIDR for VPC"
  default = "10.20.0.0/16"
}

variable "public_subnet_cidr1" {
  description = "CIDR for public subnet 1"
  default = "10.20.1.0/24"
}

variable "public_subnet_cidr2" {
  description = "CIDR for public subnet 2"
  default = "10.20.2.0/24"
}

variable "private_subnet_cidr1" {
  description = "CIDR for private subnet 1"
  default = "10.20.3.0/24"
}

variable "private_subnet_cidr2" {
  description = "CIDR for private subnet 2"
  default = "10.20.4.0/24"
}

variable "ami" {
  description = "Default Ubuntu 16.04 AMI"
  default = "ami-188fba77"
}

variable "key_path" {
  description = "Key path to get into the instances"
  default = "/Users/ineshmaran/inesh-key.pem"
}
