# after create keypair wit keygen we have id_rsa.pub file
resource "aws_key_pair" "aws_key" {                             #what will be key name on aws console
  key_name   = "aws_key"                                        #this is our custom shh key name and key id
  public_key = file("${path.module}/id_rsa.pub")
}


#to print the key name
output "keyname" {
  value = "${aws_key_pair.aws_key.key_name}"
}



# key pair assign to ec2
resource "aws_instance" "web" {
  ami                    = "ami-0b0ea68c435eb488d"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.key-tf.key_name
  tags = {
    Name = "first-tf-instance"
  }
}
