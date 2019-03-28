resource "aws_security_group" "inesh_test_sg" {
    name = "inesh_test_web_sg"

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
