provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "safe_firewall" {
  name        = "secure-admin-access"
  description = "Only allow trusted admin access"

  # Entry Door (Ingress) - Now with a description so the scanner knows it's intended!
  ingress {
    description = "Allow SSH from trusted admin IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["192.168.1.50/32"] 
  }

  # Exit Door (Egress) - Security tools require you to explicitly define where traffic leaves
  egress {
    description = "Allow all outbound traffic safely"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # This means "all protocols"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
