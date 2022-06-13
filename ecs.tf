
resource "aws_ecs_cluster" "fargate-cluster" {
  name = var.ecs_cluster_name
}

#LOAD BALANCE DA APLICACAO
resource "aws_alb" "ecs_cluster_alb" {
  name            = "${var.proj_name}-alb"
  internal        = false
  subnets         = [aws_subnet.public-subnet-1.id, aws_subnet.public-subnet-2.id, aws_subnet.public-subnet-3.id]
  security_groups = [aws_security_group.ecs_alb_security_group.id]

  tags = {
    Name = "${var.proj_name}-ALB"
  }
}

#target group ECS SERVICE#
resource "aws_alb_target_group" "ecs_app_target_group" {
  name        = "${var.ecs_service_name}-TG"
  port        = var.container_port
  protocol    = "HTTP"
  vpc_id      = aws_vpc.terraform-vpc.id
  target_type = "ip"


  tags = {
    Name = "${var.ecs_service_name}-TG"
  }
}


resource "aws_alb_listener" "listener_http" {
  load_balancer_arn = aws_alb.ecs_cluster_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.ecs_app_target_group.id
    type             = "forward"
  }

}



resource "aws_ecs_service" "service_terraform" {
  name            = var.ecs_service_name
  cluster         = aws_ecs_cluster.fargate-cluster.id
  task_definition = aws_ecs_task_definition.terraform-task-definition.arn
  desired_count   = var.service_desired_count
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = [aws_subnet.private-subnet-1.id, aws_subnet.private-subnet-2.id, aws_subnet.private-subnet-3.id]
    security_groups  = [aws_security_group.sg_ecs_service_terraform.id]
    assign_public_ip = true
  }

  load_balancer {
    container_name   = var.container_name
    container_port   = var.container_port
    target_group_arn = aws_alb_target_group.ecs_app_target_group.arn
  }
}


