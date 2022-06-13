module "module_template" {
  source                = "../"
  fargate_cpu           = 512
  fargate_memory        = 1024
  proj_name             = "exemplo"
  ecs_service_name      = "svc-exemplo"
  service_desired_count = 1
  ecs_cluster_name      = "cluster-exemplo"
  task_name             = "task-exemplo"
  container_name        = "container-exemplo"
  container_image       = "nginx"
  container_port        = 80
  container_cpu         = 10
  container_memory      = 128
  ecr_name              = "teste"
  vpc_cidr              = "10.0.0.0/16"
  retention_in_days     = 7
  public_subnet_1_cidr  = "10.0.1.0/24"
  public_subnet_2_cidr  = "10.0.2.0/24"
  public_subnet_3_cidr  = "10.0.3.0/24"
  private_subnet_1_cidr = "10.0.11.0/24"
  private_subnet_2_cidr = "10.0.22.0/24"
  private_subnet_3_cidr = "10.0.33.0/24"
  environment = [
    {
      "name" : "EXEMPLO1",
      "value" : "exemplo1"
    },
    {
      "name" : "EXEMPLO2",
      "value" : "b"
    }
  ]

}
