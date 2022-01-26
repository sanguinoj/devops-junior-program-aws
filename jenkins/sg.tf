#Security group
resource "aws_security_group" "jenkins_traffic" {
  name        = "jenkins_traffic"
  description = "Allow ssh and standard http/https ports inbound and everything outbound"

# inbound
dynamic "ingress" {
    iterator = port
    for_each = var.ingressrules
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
# outbound 

egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

tags = {
    "Name" = "Jenkins-SG"
  }
}
