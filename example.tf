provider "aws" {
  region = var.region
}

resource "aws_instance" "ec2instance" {
  ami           = var.amis[var.region]
  instance_type = "t2.micro"
  key_name      = "keyPairMAMint"

}

