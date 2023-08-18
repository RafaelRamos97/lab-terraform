resource "aws_key_pair" "key-terraform" {
  key_name   = "key-terraform"
  public_key = file("./aws-key.pub")

  /*Obs: Gere sua propria chave e substitua no caminho `./"adicione sua chave.pub" ` */

}

resource "aws_instance" "vm-terraform-" {
  ami                    = "ami-053b0d53c279acc90"
  instance_type          = "t2.micro"
  count                  = 2
  key_name               = aws_key_pair.key-terraform.key_name
  subnet_id              = aws_subnet.subnet-terraform.id
  vpc_security_group_ids = [aws_security_group.sg-terraform.id]

  associate_public_ip_address = true

  tags = {
    Name        = "vm-terraform-${count.index}"
    Environment = "Dev"
  }


}