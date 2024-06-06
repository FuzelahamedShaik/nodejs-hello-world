resource "aws_ecs_task_definition" "hello_world" {
  family                   = "hello-world"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([
    {
      name      = "hello-world"
      image     = "YOUR_DOCKERHUB_USERNAME/hello-world:latest"
      essential = true
      portMappings = [
        {
          containerPort = 3000
          hostPort      = 3000
        }
      ]
    }
  ])
}
