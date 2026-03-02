
    provider "aws" {
      region = var.aws_region
    }
    
    resource "aws_security_group" "nginx_sg" {
      name        = "${var.environment}-nginx-sg"
      description = "Allow HTTP and SSH"
    
      ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    
      ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    
      egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    
      tags = {
        Name = "${var.environment}-nginx-sg"
      }
    }
    
    resource "aws_instance" "nginx_server" {
      ami           = var.ami_id # Specify a valid Ubuntu/Amazon Linux AMI ID for your region
      instance_type = var.instance_type
      key_name      = var.key_name # Add your key pair name here
      vpc_security_group_ids = [aws_security_group.nginx_sg.id]
    
      user_data = <<-EOF
                  #!/bin/bash
                  sudo apt update -y
                  sudo apt install nginx -y
                  sudo systemctl start nginx
                  sudo systemctl enable nginx
                  echo "<h1>Deployed via Terraform.</h1>" | sudo tee /var/www/html/index.html
                  EOF
    
      tags = {
        Name = "${var.environment}-nginx-server"
      }
    }
    
