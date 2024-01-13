# after create keypair wit keygen we have id_rsa.pub file
resource "aws_key_pair" "aws_key" {                             #what will be key name on aws console
  key_name   = "aws_key"                                        #this is our custom shh key name and key id
  public_key = file("${path.module}/id_rsa.pub")
}


#to print the key name
output "keyname" {
  value = "${aws_key_pair.aws_key.key_name}"
}