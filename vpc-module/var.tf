variable "cidr" {
  default = ""
  type    = string
}

variable "name"{
  default = "tf"
  type    = string
}
variable "private_subnets"{
  default = ""
  type    = list
}

variable "public_subnets"{
  default = ""
  type    = list
}

variable "enable_nat_gateway"{
  default = "false" 
  tpye=string
}
variable "enable_vpn_gateway"{
  default = "false"
  tpye=string
}
variable "azs"{
  default=""
  type=string
}
