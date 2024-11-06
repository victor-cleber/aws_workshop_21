#------------------------
# ALB
#------------------------

# Create  ALB Target Groups

resource "aws_lb_target_group" "my_tg_a" { // Target Group A
  name     = "target-group-a"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}

resource "aws_lb_target_group" "my_tg_b" { // Target Group B
  name     = "target-group-b"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}

resource "aws_lb" "mediawiki_alb" {
  name               = "mediawiki-4-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_security_group.id]
  subnets            = [aws_subnet.alb_subnet_a.id, aws_subnet.alb_subnet_b.id]

  tags = {
    Environment = "to_change"
  }
}

resource "aws_lb_listener" "mediawiki_alb_listener" {
  load_balancer_arn = aws_lb.mediawiki_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_tg_a.arn
  }
}

# 443 Listner TCP
resource "aws_lb_listener" "liferay_https_tcp_listner" {
  load_balancer_arn = aws_lb.mediawiki_alb.arn
  port              = "443"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_tg_a.arn
  }
}


resource "aws_launch_template" "mediawiki_launch_template" {
  name          = "media-wiki-lt"
  image_id      = "ami-087066f29f7b4a01b"
  instance_type = "t2.micro"
  #user_data       = file("user-data.sh")
  vpc_security_group_ids = [aws_security_group.app_security_group.id]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "mediawiki_asg" {
  depends_on       = [aws_launch_template.mediawiki_launch_template]
  name             = "mediawiki_asg"
  desired_capacity = 1

  min_size = 1
  max_size = 1

  vpc_zone_identifier = [aws_subnet.app_subnet_a.id, aws_subnet.app_subnet_b.id]
  target_group_arns   = [aws_lb_target_group.my_tg_a.arn, aws_lb_target_group.my_tg_b.arn]
  launch_template {
    id      = aws_launch_template.mediawiki_launch_template.id
    version = aws_launch_template.mediawiki_launch_template.latest_version
  }
}