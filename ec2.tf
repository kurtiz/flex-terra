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
  instance_type = var.manager-server_instance_type
  key_name = var.key_name
  subnet_id = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.manager_server_sg.id]
  tags = {
    Name = "manager-server"
  }
}
