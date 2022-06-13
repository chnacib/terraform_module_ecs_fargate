#SG ELB
resource "aws_security_group" "ecs_alb_security_group" {
  name        = "${var.ecs_cluster_name}-SG-ALB"
  description = "Security group ECS cluster"
  vpc_id      = aws_vpc.terraform-vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {

    Name = "sg_${var.proj_name}"
  }


}



#sg ECS SERVICE
resource "aws_security_group" "sg_ecs_service_terraform" {
  name        = "${var.ecs_service_name}-SG-SVC"
  description = "ECS Service"
  vpc_id      = aws_vpc.terraform-vpc.id

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }



  tags = {

    Name = "sg_${var.proj_name}"
  }

}
