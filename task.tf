resource "aws_ecs_task_definition" "terraform-task-definition" {
  family                   = var.task_name
  cpu                      = var.fargate_cpu
  memory                   = var.fargate_memory
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  execution_role_arn       = aws_iam_role.fargate_iam_role.arn
  task_role_arn            = aws_iam_role.fargate_iam_role.arn
  container_definitions = jsonencode([
    {
      name        = var.container_name
      image       = "${aws_ecr_repository.fargate.repository_url}"
      cpu         = var.container_cpu
      memory      = var.container_memory
      essential   = true
      environment = var.environment
      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.container_port
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = "${aws_cloudwatch_log_group.main.name}"
          awslogs-region        = "${var.region}"
          awslogs-stream-prefix = "${var.container_name}"

        }
      }
    } #para adicionar outro container adicione uma vírgula após essas chaves

  ])
}
