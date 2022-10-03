resource "aws_vpc" "dot_dev_vpc" {
  cidr_block = "30.0.0.0/16"
  tags = {
    Name = var.env_name
  }
}

resource "aws_subnet" "dot_dev_subnet" {
  vpc_id                  = aws_vpc.dot_dev_vpc.id
  cidr_block              = "30.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = var.env_name
  }
}

resource "aws_internet_gateway" "dot_dev_ig" {
  vpc_id = aws_vpc.dot_dev_vpc.id

  tags = {
    Name = "dev"
  }
}

resource "aws_route_table" "dot_dev_rt" {
  vpc_id = aws_vpc.dot_dev_vpc.id
  tags = {
    Name = var.env_name
  }
}

resource "aws_route" "r" {
  route_table_id         = aws_route_table.dot_dev_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.dot_dev_ig.id

}

resource "aws_route_table_association" "dot_dev_tba" {
  subnet_id      = aws_subnet.dot_dev_subnet.id
  route_table_id = aws_route_table.dot_dev_rt.id
}

resource "aws_security_group" "dot_dev_sg" {
  name        = "dev_security_group"
  description = "Allow inbound http,https, and ssh traffic"
  vpc_id      = aws_vpc.dot_dev_vpc.id

  ingress {
    description = "HTTP traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    description = "HTTPS traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    description = "SSH Connection"
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

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_key_pair" "dot_dev_keypair" {
  key_name   = "ec2-keypair"
  public_key = file("~/.ssh/ec2_keypair.pub")
}

resource "aws_instance" "web" {
  ami                    = data.aws_ami.dot_dev_ami.id
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.dot_dev_keypair.id
  vpc_security_group_ids = [aws_security_group.dot_dev_sg.id]
  subnet_id              = aws_subnet.dot_dev_subnet.id
  user_data              = file("user_data.sh")
  tags = {
    Name = var.env_name
  }
}