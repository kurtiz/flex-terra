resource "aws_instance" "web_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public_subnet.id
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.flexcube_sg.id]
  tags = {
    Name = "flexcube-web-server"
  }
}

resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.private_subnet.id
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.flexcube_sg.id]
  tags = {
    Name = "flexcube-app-server"
  }
}

resource "aws_instance" "db_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.private_subnet.id
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.flexcube_sg.id]
  tags = {
    Name = "flexcube-db-server"
  }
}

resource "aws_instance" "manager_server" {
  ami           = "ami-0df368112825f8d8f"
  instance_type = "t2.micro"
  key_name = "flex-key-pair"
  subnet_id = "subnet-083fa8817040e96b1"
  vpc_security_group_ids = ["sg-0776af6c059db9142"]
  tags = {
    Name = "manager-server"
  }
}
