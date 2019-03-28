# Define Security Groups for puppet.

resource "aws_security_group" "inesh_sg" {
    name = "inesh_sg"
    vpc_id = "${aws_vpc.inesh_vpc.id}"
    description = "Allowing ports to access puppet"

    ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
      from_port = 443
      to_port = 443
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
      from_port = -1
      to_port = -1
      protocol = "icmp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
      from_port = 8140
      to_port = 8140
      protocol = "tcp"
      cidr_blocks = ["${var.private_subnet_cidr1}","${var.private_subnet_cidr2}"]
    }

    tags {
      Name = "inesh_sg"
    }
}
