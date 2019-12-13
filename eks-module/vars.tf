variable "cluster-name" {
  default = "terraform-eks-nav"
  type    = string
}

variable "env" {
  default = "dev"
  type    = string
}

variable "vpc_id"{
  default = "vpc-****************"
  type    = string
}

variable "instance_type"{
  default = "t2.large"
  type    = string
}

variable "name_prefix"{
  default = "tf"
  type    = string
}

variable "image_id"{
  default = "ami-*************"
  type    = string
}

variable "desired_capacity"{
  default = "2"
  type    = string
}

variable "owner"{
  default = ""
  type    = string
}

variable "subnet_ids"{
  default = ["subnet-**********", "subnet-***********"]
  type    = list
}

variable "max_size"{
  default = "3"
  type    = string
}

variable "min_size"{
  default = "1"
  type    = string 
}


