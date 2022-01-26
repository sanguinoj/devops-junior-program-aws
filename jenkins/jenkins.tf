# create ec2 instance
resource "aws_instance" "jenkins-server" {
  ami           = var.jenkins_ami
  instance_type = "t2.micro"
  security_groups = [aws_security_group.jenkins_traffic.name]
  key_name = "jenkins-key"


# remote exec install java and jenkins

provisioner "file" {
  source = "/home/vagrant/terraform/devops-junior-program-aws-1/jenkins/docker/Dockerfile"
  destination = "/home/ec2-user/Dockerfile"
}

provisioner "file" {
  source = "/home/vagrant/terraform/devops-junior-program-aws-1/jenkins/docker/docker-compose.yml"
  destination = "/home/ec2-user/docker-compose.yml"
}


provisioner "remote-exec"  {
    inline  = [
     


#Install git in your EC2 instance Amazon Linux2"
       "sudo yum update -y",
       "sudo yum install git -y",
#Docker CE Install to Amazon Linux2       
       "sudo amazon-linux-extras install docker -y",
       "sudo service docker start",
       "sudo usermod -a -G docker ec2-user",
       "sudo chkconfig docker on",
     ]
   }    

 provisioner "remote-exec"  {
    inline  = [                      

#docker-compose install to Amazon Linux2

      "sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose",
      "sudo chmod +x /usr/local/bin/docker-compose",
      "sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose",

#Install jenkins con docker-compose
      "cd /home/ec2-user",
      "docker-compose up -d",
     
 #JENKINS BY COMMAND  
      #"sudo amazon-linux-extras install java-openjdk11 -y",
      #"sudo yum install -y jenkins",
      #"sudo yum -y install wget",
      #"sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo",
      #"sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key",
      #"sudo yum upgrade -y",
      #"sudo amazon-linux-extras install epel -y",
      #"sudo yum install jenkins -y",
      #"sudo systemctl start jenkins",
      ]
   }

connection {
    type         = "ssh"
   host         = self.public_ip
    user         = "ec2-user"
    private_key  = file("key/jenkins-key.pem" )
   }
  tags  = {
    "Name"      = "Jenkins-Server"
      }
 }
