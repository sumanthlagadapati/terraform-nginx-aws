
    output "instance_public_ip" {
      description = "Public IP address of the Nginx EC2 instance"
      value       = aws_instance.nginx_server.public_ip
    }
    
    output "instance_public_dns" {
      description = "Public DNS of the Nginx EC2 instance"
      value       = aws_instance.nginx_server.public_dns
    }
    
    output "security_group_id" {
      description = "ID of the security group"
      value       = aws_security_group.nginx_sg.id
    }
    
