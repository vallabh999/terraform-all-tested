resource "aws_launch_configuration" "example-launchconfig" {
  name_prefix          = "example-launchconfig"
  image_id             = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type        = "t2.micro"
  key_name             = "${var.key_name}"
  associate_public_ip_address = "true"
  security_groups      = "${var.security_groups}"
  user_data            = "#!/bin/bash\napt-get update\napt-get -y install nginx\nMYIP=`ifconfig | grep 'addr:10' | awk '{ print $2 }' | cut -d ':' -f2`\necho 'this is: '$MYIP > /var/www/html/index.html"
  lifecycle              { create_before_destroy = true }
}

resource "aws_autoscaling_group" "example-autoscaling" {
  name                 = "example-autoscaling"
  vpc_zone_identifier = ["${var.subnets}"]
  launch_configuration = "${aws_launch_configuration.example-launchconfig.name}"
  min_size             = 2
  max_size             = 2
  health_check_grace_period = 300
  health_check_type = "ELB"
  force_delete = true

  tags = [
    {
      key                 = "Name"
      value               = "${var.name_prefix}${var.cluster_service}-asg"
      propagate_at_launch = true
    },
    {
      key                 = "Vertical"
      value               = "${var.cluster_vertical}"
      propagate_at_launch = true
    },
    {
      key                 = "App"
      value               = "${var.cluster_app}"
      propagate_at_launch = true
    },
    {
      key                 = "Role"
      value               = "${var.cluster_role}"
      propagate_at_launch = true
    },
    {
      key                 = "Cluster"
      value               = "${var.cluster_vertical}-${var.cluster_app}"
      propagate_at_launch = true
    },
  ]
}

resource "aws_autoscaling_attachment" "asg_external" {
  alb_target_group_arn   = "${aws_alb_target_group.alb_front_http.arn}"
  autoscaling_group_name = "${aws_autoscaling_group.example-autoscaling.id}"
}
