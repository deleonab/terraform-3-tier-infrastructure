variable "region"{
    default= "eu-west-2"
}

variable "vpc_cidr"{

default = "172.16.0.0/16"
}                     

variable "enable_dns_support"{
    default = "true"
}              
variable "enable_dns_hostnames"{
    default = "true"
}           
variable "enable_classiclink"{
    default = "false"

}             

variable "enable_classiclink_dns_support"{
    default = "false"
} 

variable "preferred_number_of_public_subnets" {
  default = null
}
variable "preferred_number_of_private_subnets" {
  default = null
}

variable "ami" {
  type        = string
  description = "AMI ID for the launch template"
}

variable "keypair" {
  type        = string
  description = "key pair for the instances"
}

variable "account_no" {
  type        = number
  description = "the account number"
}

variable "master-username" {
  type        = string
  description = "RDS admin username"
}

variable "master-password" {
  type        = string
  description = "RDS master password"
}