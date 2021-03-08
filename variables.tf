variable "cidr_pub1" {
  type = string
  default = "10.0.4.0/24"
}


variable "zone_pub1" {
  type = string
  default = "us-east-1a"
}

variable "cidr_pub2" {
  type = string
  default = "10.0.1.0/24"
}

variable "zone_pub2" {
  type = string
  default = "us-east-1b"
}

variable "alb_cidr_blk" {
  type =  list(string)
  default = ["0.0.0.0/0"] 
}