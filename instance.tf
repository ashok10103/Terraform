resource "aws_key_pair" "awsirelandkey" {
  key_name = "awsirelandkey"
  public_key = "${file("${var.PATH_TO_PUBLICKEY}")}"
}


resource "aws_instance" "web-server" {
  ami = "${lookup(var.AMIS,var.AWS_REGION)}"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.awsirelandkey.key_name}"

  provisioner "file" {
    source = "scripts.sh"
    destination = "/tmp/scripts.sh"
  }

  provisioner "remote-exec" {
      inline = [
        "chmod +x /tmp/scripts.sh",
        "sudo /tmp/scripts.sh"
      ]
  }

  connection {
    user = "${var.INSTANCE_USERNAME}"
    private_key = "${file("${var.PATH_T0_PRIVATEKEY}")}"
  }
}
