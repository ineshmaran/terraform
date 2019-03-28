resource "aws_instance" "inesh_test_myweb" {
    ami = "ami-41e9c52e"
    instance_type = "t2.micro"
    security_groups = ["${aws_security_group.inesh_test_sg.name}"]
    tags {
      Name = "inesh_test_web"
      application = "web-server"
      environment = "testing"
    }
}
