resource "aws_ecs_cluster" "minecraft_server" {
  name = "minecraft_server"
}

resource "aws_ecs_task_definition" "minecraft_server" {
  cpu                      = "4096"
  memory                   = "8192"
  family                   = "minecraft-server"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = aws_iam_role.ecs_tasks_execution_role.arn

  container_definitions = jsonencode([
    {
      name       = "minecraft-server"
      image      = "itzg/minecraft-server:java17-alpine"
      essential  = true
      tty        = true
      stdin_open = true
      restart    = "unless-stopped"
      portMappings = [
        {
          containerPort = 25565
          hostPort      = 25565
          protocol      = "tcp"
        },
        {
          containerPort = 25575
          hostPort      = 25575
          protocol      = "tcp"
        }
      ]
      environment = [
        {
          name  = "EULA"
          value = "TRUE"
        },
        {
          "name" : "VERSION",
          "value" : "1.20.2"
        },
        {
          "name" : "ENABLE_RCON",
          "value" : "true"
        },
        {
          "name" : "RCON_PORT",
          "value" : "25575"
        },
        {
          "name" : "RCON_PASSWORD",
          "value" : "World"
        },
        {
        "name" : "MODE",
        "value": "creative"
        },
        {
        "name" : "LEVEL_TYPE",
        "value": "FLAT"
        },
        {
          name  = "SPAWN_ANIMALS"
          value = "FALSE"
        },
       {
          name  = "SPAWN_MONSTERS"
          value = "FALSE"
        },
        {
          name  = "SPAWN_NPCS"
          value = "FALSE"
        },
        {
          name  = "DIFFICULTY"
          value = "hard"
        },   
        {
          name  = "SEED"
          value = "-1785852800490497910"
        },   
        {
          name  = "OVERRIDE_OPS"
          value = "true"
        },
                {
          name  = "OPS"
          value = "N0tNamed"
        }
      ]
      mount_points = [
        {
          sourceVolume  = "efs-mount"
          containerPath = "/mnt/efs"
        },
      ],
    }
  ])
  volume {
    name = "minecraft-data"
  }
}

resource "aws_ecs_service" "minecraft_server" {
  name            = "minecraft_server"
  cluster         = aws_ecs_cluster.minecraft_server.id
  task_definition = aws_ecs_task_definition.minecraft_server.arn
  desired_count   = 1
  network_configuration {
    subnets          = module.vpc.public_subnets
    security_groups  = [aws_security_group.minecraft_server.id]
    assign_public_ip = true
  }
  launch_type = "FARGATE"
}

data "aws_iam_policy_document" "ecs_tasks_execution_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecs_tasks_execution_role" {
  name               = "ecs-task-execution-role"
  assume_role_policy = data.aws_iam_policy_document.ecs_tasks_execution_role.json
}

resource "aws_iam_role_policy_attachment" "ecs_tasks_execution_role" {
  role       = aws_iam_role.ecs_tasks_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}
