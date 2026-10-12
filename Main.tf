# This tells the computer we want to use AWS
provider "aws" {
  region = "us-east-1"
}

# This builds a firewall rule (Security Group)
resource "aws_security_group" "bad_firewall" {
  name        = "open-to-the-world"
  description = "This is a dangerous firewall rule!"

  # WHOOPS! This line leaves the server open to ANYONE on the internet (0.0.0.0/0)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["192.168.1.50/32"] 
  }
}
