resource "aws_eip" "inesh_test_app_eip" {
    instance = "${aws_instance.inesh_test_myapp.id}"
}
