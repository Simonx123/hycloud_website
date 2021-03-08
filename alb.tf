resource "aws_lb" "hy_alb" {
  name               = "Hycloud-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [aws_subnet.public_sub1.id, aws_subnet.public_sub2.id]
  enable_deletion_protection = false

  tags = {
    Name = "hycloud_alb"
  }
}

resource "aws_lb_target_group" "hycloud_tg" {
  name     = "hycloud-tg-lb-tg"
  port     = 80
  protocol = "HTTP"
  protocol_version = "HTTP1"
  vpc_id   = aws_vpc.main.id
  health_check {
      enabled = true
      protocol = "HTTP"
      path = "/"
      port = 80
      healthy_threshold = 5
      unhealthy_threshold = 2
      timeout = 5
      
     }

}

resource "aws_lb_listener" "entry_80_end" {
  load_balancer_arn = aws_lb.hy_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "entry_443_end" {
  load_balancer_arn = aws_lb.hy_alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = aws_acm_certificate.cert.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.hycloud_tg.arn
  }
}