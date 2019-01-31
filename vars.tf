variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
  default = "eu-west-1"
}

variable "AMIS" {
  type = "map"
  default = {
    ap-south-1 = "ami-825e34ed"
    eu-west-1  = "ami-bbc542c8"
    eu-west-2  = "	ami-4bc7cd2f"
  }
}
