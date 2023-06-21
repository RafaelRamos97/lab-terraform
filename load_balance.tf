resource "aws_lb_target_group" "target_group" {
  name     = "Target-Group-Terraform"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc-terraform.id

  health_check {
    path                = "/"
    interval            = 15
    timeout             = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

resource "aws_lb_target_group_attachment" "attachment1" {
  target_group_arn = aws_lb_target_group.target_group.arn
  target_id        = aws_instance.vm-terraform.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "attachment2" {
  target_group_arn = aws_lb_target_group.target_group.arn
  target_id        = aws_instance.vm-terraform-2.id
  port             = 80
}


resource "aws_lb" "load_terraform" {
  name               = "lb-terraform"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg-terraform.id]
  subnets            = [aws_subnet.subnet-terraform.id, aws_subnet.subnet-terraform-2.id]


  tags = {
    Environment = "production"
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.load_terraform.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}

resource "aws_lb_listener_rule" "host_based_weighted_routing" {
  listener_arn = aws_lb_listener.front_end.arn
  priority     = 99

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }

  condition {
    host_header {
      values = ["my-service.*"]
    }
  }
}

