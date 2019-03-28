resource "aws_security_group" "inesh_test_sg1" {
    name = "inesh_test_app_sg"

    ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["${aws_eip.inesh_test_web_eip.public_ip}/32"]
    }

    ingress {
      from_port = 443
      to_port = 443
      protocol = "tcp"
      cidr_blocks = ["${aws_eip.inesh_test_web_eip.public_ip}/32"]
    }

    ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["192.168.99.100/32"]
    }

    ingress {
      from_port = 21
      to_port = 21
      protocol = "tcp"
      cidr_blocks = ["192.168.99.100/32"]
    }

    ingress {
      from_port = 25
      to_port = 25
      protocol = "tcp"
      cidr_blocks = ["192.168.99.100/32"]
    }

}
