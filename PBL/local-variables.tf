locals{


name = "${var.department}-${var.environment}"

}

variable "department" {
  default = "dev"
}

variable "environment" {
  default = "UAT"
}

