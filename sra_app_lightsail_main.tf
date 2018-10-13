# Use terraform to build an AWS lightsail instance running RSA app
# Notice: all files ending with .tf will be imported.
# references：
#   - https://lightsail.aws.amazon.com
#   - https://www.terraform.io/docs/providers/aws/r/lightsail_instance.html



# type: aws_lightsail_instance，name: rsa_app
# reference： 
#   - https://www.terraform.io/docs/configuration/resources.html
resource "aws_lightsail_instance" "sra_app" {
  name = "${var.project_name}_${terraform.workspace}"

  availability_zone = "${var.availability_zone}"

  blueprint_id = "${var.blueprint_id}"

  bundle_id = "${var.bundle_id}"

  key_pair_name = "${var.aws_lightsail_instance_key_pair_name}"

  # init script
  user_data = ""

  # define connection
  # reference:
  #   - https://www.terraform.io/docs/provisioners/connection.html
  connection {
    # default amazon linux user
    user = "ec2-user"
    host = "${aws_lightsail_instance.sra_app.public_ip_address}"
    private_key = "${file("${var.aws_lightsail_instance_private_key}")}"
    type = "ssh"
    timeout = "2m"
  }

  # copy file to the server
  # reference：
  #   - https://www.terraform.io/docs/provisioners/file.html
  provisioner "file" {
    source = "scripts"
    destination = "scripts"
  }

  # copy .aws credentials to the server
  provisioner "file" {
    source = ".aws"
    destination = ".aws"
  }

  # script that run at remote server
  # reference：
  #   - https://www.terraform.io/docs/provisioners/remote-exec.html
  provisioner "remote-exec" {
    inline = [
      "aws lightsail attach-static-ip --static-ip-name SRA-app-Seoul --instance-name ${aws_lightsail_instance.sra_app.name}"
      "chmod +x ./scripts/install_docker.sh",
      "sudo ./scripts/install_docker.sh"
    ]
  }

  # script that run locally after terraform process
  # reference：
  #   - https://www.terraform.io/docs/provisioners/local-exec.html
  provisioner "local-exec" {
    command = "echo ${aws_lightsail_instance.sra_app.public_ip_address} > public_ip.txt"
  }
}

# output variables
# reference：
#   - https://www.terraform.io/intro/getting-started/outputs.html

output "public_ip_address" {
  value = "${aws_lightsail_instance.sra_app.public_ip_address}"
}

output "username" {
  value = "${aws_lightsail_instance.sra_app.username}"
}

output "key_pair_name" {
  value = "${aws_lightsail_instance.sra_app.key_pair_name}"
}

output "name" {
  value = "${aws_lightsail_instance.sra_app.name}"
}
