resource "aws_launch_template" "hy_launch" {
  name_prefix   = "hycloud"
  image_id      = "ami-06c2836176b66bc00"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance_sg.id]
}


resource "aws_autoscaling_group" "hy_auto" {
  vpc_zone_identifier   = [aws_subnet.public_sub1.id, aws_subnet.public_sub2.id]
  desired_capacity   = 2
  max_size           = 3
  min_size           = 2

  launch_template {
    id      = aws_launch_template.hy_launch.id
  
  }

    lifecycle {
    ignore_changes = [load_balancers, target_group_arns]
  }
}



# Create a new ALB Target Group attachment
resource "aws_autoscaling_attachment" "asg_attachment_tes" {
  autoscaling_group_name = aws_autoscaling_group.hy_auto.id
  alb_target_group_arn   = aws_lb_target_group.hycloud_tg.arn
}