resource "aws_key_pair" "key_pair" {
  key_name = "aws-key"
  public_key = file("C:/AWS/private_keys/public")
}

resource "aws_instance" "instance" {
  ami = ""
  associate_public_ip_address = true
  key_name = aws_key_pair.key_pair.key_name

}