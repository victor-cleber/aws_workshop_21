variable "region" {
  type        = string
  description = "AWS region where the infrastructure will be created"
  #default     = "us-east-1"
  #default = "ap-southeast-2"
}

variable "vpc_name" {
  type        = string
  description = "AWS vpc name"
  default     = "aws_workshop"
}

variable "workshop" {
  type        = string
  description = "Workshop Edition"
  default     = "workshop-21"
}

variable "owner" {
  type        = string
  description = "Author"
  default     = "Victor Cleber"
}

variable "group" {
  type        = string
  description = "Member of"
  default     = "Group 3"
}

variable "automation" {
  type        = string
  description = "Automation"
  default     = "terraform"
}
variable "subject" {
  type        = string
  description = "Subject of the project"
  default     = "Media Wiki"
}

variable "course" {
  type        = string
  description = "AWS training "
  default     = "Cloud Training - AWS bootcamp"
}

variable "username" {
  type    = string
  #default = "admin4wiki"  
}