variable "region" {
  default = "us-east-1"
}

variable "ami_id" {
  type = map(string)

  default = {
    us-east-1 = "ami-04b70fa74e45c3917"
  }
  }

