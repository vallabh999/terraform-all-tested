

resource "aws_alb" "alb_front" {
	name		=	"${var.alb_name}"
	internal	=	false
	security_groups	=	"${var.security_groups}"
	subnets		=	["${var.subnets}"]
	enable_deletion_protection	=	false
}



resource "aws_alb_target_group" "alb_front_http" {
	name	= "${var.alb_target_group_name}"
	vpc_id	= "${var.vpc_id}"
	port	= "${var.alb_tg_port}"
	protocol	= "${var.alb_tg_protocol}"
	health_check {
                path = "${var.alb_tg_health_check_path}"
                port = "${var.alb_tg_health_check_port}"
                protocol = "${var.alb_tg_health_check_protocol}"
                healthy_threshold = "${var.alb_tg_healthy_threshold}"
                unhealthy_threshold = "${var.alb_tg_unhealthy_threshold}"
                interval = "${var.alb_tg_health_check_interval}"
                timeout = "${var.alb_tg_health_check_timeout}"
                matcher = "200-308"
        }
}


resource "aws_alb_listener" "alb_listener" {  
  load_balancer_arn = "${aws_alb.alb_front.arn}"  
  port              = "${var.alb_listener_port}"  
  protocol          = "${var.alb_listener_protocol}"
  
  default_action {    
    target_group_arn = "${aws_alb_target_group.alb_front_http.arn}"
    type             = "forward"  
  }
}

