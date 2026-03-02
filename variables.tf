
    variable "aws_region" {
      description = "AWS region"
      type        = string
      default     = "us-east-1"
    }
    
    variable "ami_id" {
      description = "AMI ID for the EC2 instance (e.g., Ubuntu or Amazon Linux 2 in us-east-1)"
      type        = string
      # You should find a current AMI ID for your chosen region and OS
      # Example for Amazon Linux 2 in us-east-1 (check for the latest): ami-0c7217cdde317cfec
      # Example for Ubuntu 22.04 in us-east-1 (check for the latest): ami-053b0d53c279acc90
      default     = "ami-053b0d53c279acc90" # Update this with a valid AMI ID for us-east-1 or your region
    }
    
    variable "instance_type" {
      description = "EC2 instance type"
      type        = string
      default     = "t2.micro"
    }
    
    variable "key_name" {
      description = "Name of the EC2 key pair to use for SSH access"
      type        = string
      # You need to create a key pair in your AWS account and put its name here
      default     = "" # <-- PUT YOUR KEY PAIR NAME HERE
    }
    
    variable "environment" {
      description = "Deployment environment (e.g., dev, prod)"
      type        = string
      default     = "dev"
    }
    
