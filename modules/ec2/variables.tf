variable "subnet_id" {
  type        = string
  description = "Subnet ID where the EC2 instance will be launched"
}

variable "ami_id" {
  type        = string
  description = "AMI ID for the EC2 instance"
}

variable "instance_type" {
  type        = string
  description = "Type of EC2 instance to launch"
}

variable "security_group_id" {
  type        = string
  description = "Security group ID to attach to the EC2 instance"
}
