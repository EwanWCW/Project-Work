
resource "aws_instance" "Natwest-Vm-Ewan" {
  count                  = 3
  ami                    = "ami-08978028fd061067a"
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.nkpEW.key_name
  vpc_security_group_ids = [aws_security_group.sg1.id]
  subnet_id              = aws_subnet.sn1.id
  tags = {
    "Name" = "Natwest-Vm-Ewan-Ansible-${count.index}"
  }
  associate_public_ip_address = true
}

output "PublicIpAddress" {
   value = aws_instance.Natwest-Vm-Ewan1.*.public_ip
}
