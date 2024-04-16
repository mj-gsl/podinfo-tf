resource "aws_instance" "web" {
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids    = [var.security_group_id]

  user_data = <<-EOF
    #!/bin/bash
    exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
    echo "Starting setup..."
    sudo yum update -y
    sudo yum install docker -y
    sudo systemctl start docker
    sudo systemctl enable docker
    usermod -a -G docker ec2-user
    chkconfig docker on
    while ! systemctl is-active --quiet docker; do
      sleep 1
    done
      sleep 10
    echo "Attempting to start Docker container..."
    sudo docker pull stefanprodan/podinfo
    sleep 50
    sudo docker run -d -p 80:9898 stefanprodan/podinfo
    echo "Docker run command executed."
  EOF
  tags = {
    Name = "Podinfo-Web-Server"
  }
}
