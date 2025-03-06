resource "aws_key_pair" "key" {
  key_name   = "aws-instance-key"
  public_key = file("./public_key.pub")
}

resource "aws_instance" "instance" {
  ami                         = "ami-0d1ddd83282187d18"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = data.terraform_remote_state.vpc.outputs.subnet_id
  vpc_security_group_ids      = [data.terraform_remote_state.vpc.outputs.security_group_id]
  associate_public_ip_address = true


  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> public_ip.txt"
  }

  connection {
    host = self.public_ip
    type = "ssh"
    user = "ubuntu"
    private_key = file("./private_key.key")
  }

  provisioner "remote-exec" {
    inline = [ 
      "echo subnet_id: ${data.terraform_remote_state.vpc.outputs.subnet_id} >> ./subnet_id.txt"
     ]
  }

  provisioner "file" {
    content = "this is a content created by a provisioner"
    destination = "~/provisioner_file_1.txt"
  }
}

resource "aws_instance" "instance_2" {
  ami                         = "ami-0d1ddd83282187d18"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = data.terraform_remote_state.vpc.outputs.subnet_id
  vpc_security_group_ids      = [data.terraform_remote_state.vpc.outputs.security_group_id]
  associate_public_ip_address = true
  user_data = file("../../scripts/docker.sh")
}