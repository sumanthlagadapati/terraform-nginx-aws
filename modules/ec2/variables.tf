variable "instance_type" {
      description = "EC2 instance type"
      type        = string
      default     = "t2.micro"
    }
    
    variable "ami" {
      description = "AMI ID for EC2 instance"
      type        = string
      default     = "ami-0c55b159cbfafe1f0" # Example AMI ID, replace with a valid one for your region
    }
