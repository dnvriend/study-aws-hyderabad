resource "aws_instance" "instance" {
  ami                         = local.settings[local.region_selected]["ami"]
  instance_type               = "t4g.nano"
  associate_public_ip_address = true
  key_name                    = aws_key_pair.key.key_name
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = aws_subnet.public_a.id

  tags = {
    Name = "${local.name}-instance"
  }
}

resource "aws_security_group" "sg" {
  vpc_id = aws_vpc.vpc.id

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    description = "allow-ssh"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    description = "allow-http"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 443
    protocol    = "tcp"
    to_port     = 443
    description = "allow-https"
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    description = "allow-all-egress"
  }

  tags = {
    Name = "${local.name}-sg"
  }
}

resource "aws_key_pair" "key" {
  key_name   = "${local.name}-kp"
  public_key = file("id_rsa.pub")
}
