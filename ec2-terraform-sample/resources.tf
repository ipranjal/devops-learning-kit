resource "aws_key_pair" "sample_pem" {
  key_name   = "sample"
  public_key = "xxx"
}


resource "aws_instance" "dev" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.small"
  availability_zone = "eu-central-1a"
  key_name = sample_key_pair.sample_pem.key_name
  iam_instance_profile = aws_iam_instance_profile.id
  tags = {
    Name = "dev"
  }
}

resource "aws_instance" "prod" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.large"
  availability_zone = "eu-central-1b"
  key_name = aws_key_pair.sample_pem.key_name
  iam_instance_profile = aws_iam_instance_profile.id
  tags = {
    Name = "prod"
  }
}

resource "aws_security_group" "sample_sec_group" {
  name        = "sample_sec_group"
  description = "Allow TLS inbound traffic"
  vpc_id      = data.aws_vpc.default_vpc.id

  ingress {
    description      = "https web traffic"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "vesta access"
    from_port        = 8083
    to_port          = 8083
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "SSH access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "ftp"
    from_port        = 21
    to_port          = 21
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "http access"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "sample_sec_group"
  }
}