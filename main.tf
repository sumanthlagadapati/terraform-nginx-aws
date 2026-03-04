
   provider "aws" {
  region = var.aws_region
}

module "ec2_instance" {
  source = "./modules/ec2"
  ami    = "ami-0c55b159cbfafe1f0" # Replace with your desired AMI ID for your region
  instance_type = "t2.micro"
}

output "instance_public_ip" {
 description = "Public IP of the EC2 instance"
 value       = module.ec2_instance.public_ip
}
  
