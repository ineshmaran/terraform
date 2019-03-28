resource "aws_instance" "inesh-puppet-master" {
    instance_type = "t2.micro"
    ami = "ami-188fba77"
    security_groups = ["${aws_security_group.inesh-sg.name}"]
    key_name = "terraform_inesh"
    tags {
      Name = "inesh-puppet-master"
      application = "puppet"
      env = "testing"
    }
}

resource "aws_instance" "inesh-puppet-agent" {
    instance_type = "t2.micro"
    ami = "ami-188fba77"
    security_groups = ["${aws_security_group.inesh-sg.name}"]
    key_name = "terraform_inesh"
    tags {
      Name = "inesh-puppet-agent"
      application = "puppet"
      env = "testing"
    }
}

resource "aws_security_group" "inesh-sg" {
  name = "inesh-sg"
  description = "Puppet testing SG"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 8140
      to_port = 8140
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

}
