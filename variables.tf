variable "subnetId" {
  type = string
  default = "subnet-0d592a016760852f0"
}

variable "vpcId" {
  type = string
  default = "vpc-078eedf98be5fb967"
}

variable "ami" {
  type = string
  default = "ami-0bef6cc322bfff646"
}

variable "serverName" {
  type = string
  default = "Web_Server_Test"
}

variable "multIngressSg" {
  
  default = [
    {
        description      = "SSH to instance"
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["191.234.175.30/32"]
    },
    {
        description      = "ICMP to instance"
        from_port        = -1
        to_port          = -1
        protocol         = "icmp"
        cidr_blocks      = ["191.234.175.30/32"]
    },
    {
        description      = "HTTP to instance"
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = ["191.234.175.30/32"]
    }
  ]
}