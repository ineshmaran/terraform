resource "aws_instance" "inesh_test_myapp" {
    ami = "ami-41e9c52e"
    instance_type = "t2.micro"
    security_groups = ["${aws_security_group.inesh_test_sg1.name}"]
    tags {
      Name = "inesh_test_app1"
      application = "app-server"
      environment = "testing"
    }
}
