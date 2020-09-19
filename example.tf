provider "aws" {
  region = var.region
}

resource "aws_instance" "example" {
  ami           = var.amis[var.region]
  instance_type = "t2.micro"
  key_name      = "keyPairMAMint"

  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > /tmp/ip_address_MA.txt"
  }
}

resource "aws_eip" "ip" {
    vpc = true
    instance = aws_instance.example.id
}

output "ip" {
  value = aws_eip.ip.public_ip
}

