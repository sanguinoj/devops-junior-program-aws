# var region
variable "region" {
    description = "aws beginner tutorial"
    type = string
    default = "eu-west-1"
}

variable "ingressrules" {
    type    = list(number)
    default = [8080, 443, 22]
}

# AMI EC2 LINUX

variable "jenkins_ami" {
    default = "ami-01efa4023f0f3a042"
}
variable "my_access_key" {
  description = "Access-key-for-AWS"
}
 
variable "my_secret_key" {
  description = "Secret-key-for-AWS"
}
