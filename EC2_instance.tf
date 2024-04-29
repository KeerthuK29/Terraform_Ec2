resource "aws_instance" "web1" {
   ami_id        = "${lookup(var.ami_id, var.region)}"
   instance_type = "t2.micro"
 }
