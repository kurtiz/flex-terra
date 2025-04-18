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

