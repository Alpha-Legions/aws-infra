resource "aws_key_pair" "deployer" {
  key_name   = "ec2-ub"
  public_key = var.ssh-key
}

resource "aws_security_group" "security_group" {
  name = "application"
  depends_on = [
    aws_vpc.vpc
  ]

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = var.app_port
    to_port     = var.app_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = aws_vpc.vpc.id
}


resource "aws_security_group_rule" "allow_ssh" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.security_group.id
  description              = "Allow SSH traffic from the key-pair"
  source_security_group_id = aws_security_group.security_group.id
}
