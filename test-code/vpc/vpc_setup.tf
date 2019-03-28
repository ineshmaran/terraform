#-------------
# Define MyVPC
#-------------

resource "aws_vpc" "inesh_vpc" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true

    tags {
      Name = "inesh_vpc"
    }
}


#----------------------------------------------
# Define 2 public subnets and 2 private subnets
#----------------------------------------------

resource "aws_subnet" "inesh_public_subnet1" {
    vpc_id = "${aws_vpc.inesh_vpc.id}"
    cidr_block = "${var.public_subnet_cidr1}"
    availability_zone = "ap-south-1a"

    tags {
      Name = "inesh_public_subnet1"
    }
}

resource "aws_subnet" "inesh_private_subnet1" {
    vpc_id = "${aws_vpc.inesh_vpc.id}"
    cidr_block = "${var.private_subnet_cidr1}"
    availability_zone = "ap-south-1a"

    tags {
      Name = "inesh_private_subnet1"
    }
}

resource "aws_subnet" "inesh_public_subnet2" {
    vpc_id = "${aws_vpc.inesh_vpc.id}"
    cidr_block = "${var.public_subnet_cidr2}"
    availability_zone = "ap-south-1b"

    tags {
      Name = "inesh_public_subnet2"
    }
}

resource "aws_subnet" "inesh_private_subnet2" {
    vpc_id = "${aws_vpc.inesh_vpc.id}"
    cidr_block = "${var.private_subnet_cidr2}"
    availability_zone = "ap-south-1b"

    tags {
      Name = "inesh_private_subnet2"
    }
}


#--------------------------------------------------------------
# Configure IGW to make public network accessible from internet
#--------------------------------------------------------------

resource "aws_internet_gateway" "inesh_igw" {
    vpc_id = "${aws_vpc.inesh_vpc.id}"

    tags {
      Name = "inesh_igw"
    }
}


#----------------------------------------------
# Add public subnet to allow IGW on Route Table
#----------------------------------------------

resource "aws_route_table" "inesh_public_rt" {
    vpc_id = "${aws_vpc.inesh_vpc.id}"

    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = "${aws_internet_gateway.inesh_igw.id}"
    }

    tags {
      Name = "inesh_public_rt"
    }
}

resource "aws_route_table" "inesh_private_rt" {
    vpc_id = "${aws_vpc.inesh_vpc.id}"

    tags {
      Name = "inesh_private_rt"
    }
}

resource "aws_route_table_association" "public-rt1" {
    subnet_id = "${aws_subnet.inesh_public_subnet1.id}"
    route_table_id = "${aws_route_table.inesh_public_rt.id}"
}

resource "aws_route_table_association" "public-rt2" {
    subnet_id = "${aws_subnet.inesh_public_subnet2.id}"
    route_table_id = "${aws_route_table.inesh_public_rt.id}"
}

resource "aws_route_table_association" "private-rt1" {
    subnet_id = "${aws_subnet.inesh_private_subnet1.id}"
    route_table_id = "${aws_route_table.inesh_private_rt.id}"
}

resource "aws_route_table_association" "private-rt2" {
    subnet_id = "${aws_subnet.inesh_private_subnet2.id}"
    route_table_id = "${aws_route_table.inesh_private_rt.id}"
}
