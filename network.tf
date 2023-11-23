
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name = "minecraft_vpc"
  cidr = "10.0.0.0/16"
  azs            = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  public_subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}


resource "aws_security_group" "minecraft_server" {
  name        = "minecraft_server"
  description = "minecraft_server"
  vpc_id      =  module.vpc.vpc_id

  ingress {
    description = "minecraft_server_client"
    from_port   = 25565
    to_port     = 25565
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    description = "minecraft_server_rcon"
    from_port   = 25575
    to_port     = 25575
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}