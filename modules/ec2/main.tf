resource "aws_instance" "web" {
      ami           = var.ami
      instance_type = var.instance_type
      vpc_security_group_ids = [aws_security_group.web_sg.id]
    
      user_data = <<-EOF
                  #!/bin/bash
                  sudo apt update -y
                  sudo apt install -y nginx
                  sudo systemctl start nginx
                  sudo systemctl enable nginx
                  echo "Deployed via Terraform" | sudo tee /var/www/html/index.html
                  EOF
    
      tags = {
        Name = "nginx-server"
      }
    }
    
    resource "aws_security_group" "web_sg" {
      name        = "web-sg"
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
    }
