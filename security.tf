resource "aws_security_group" "flexcube_sg" {
  name        = "flexcube-sg"
  vpc_id      = aws_vpc.flexcube_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Limit to your IP for security
  }

  ingress {
    from_port   = 7001
    to_port     = 7001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # WebLogic default port
  }

  ingress {
    from_port   = 1521
    to_port     = 1521
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16", format("%s/32", aws_instance.manager_server.private_ip)]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "manager_server_sg" {
  name = "ec2-sg"
  description = "Allow SSH"
  vpc_id = aws_vpc.flexcube_vpc.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bastion-test-ec2-sg"
  }
}
