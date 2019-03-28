resource "aws_eip" "inesh_test_web_eip" {
    instance = "${aws_instance.inesh_test_myweb.id}"
}
