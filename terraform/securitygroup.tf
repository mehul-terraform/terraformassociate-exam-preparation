resource "aws_security_group" "project-aws-sg" {
  name        = "project-aws-sg"
  description = "Allow TLS inbound traffic"
  vpc_id      =  aws_vpc.project-aws-vpc.id
 
ingress {
  description = "TLS from VPC"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  }

ingress {
  description = "TLS from VPC"
  from_port   = 80
  to_port     = 80
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
    Name = "project-aws-sg"
  }
}
