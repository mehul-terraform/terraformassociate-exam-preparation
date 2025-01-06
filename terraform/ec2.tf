resource "aws_instance" "project-aws-vm01" {
  ami           = "ami-07efac79022b86107"
  key_name      = "project-aws-keypair"
  instance_type = "t2.nano"
  vpc_security_group_ids = [aws_security_group.project-aws-sg.id]
  tags = {
    Name = "project-aws-vm01"
    }
  subnet_id  = aws_subnet.project-aws-vm.id
}
  
