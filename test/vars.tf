variable "AWS_REGION" {
  default = "us-east-1"
}

##Not Used#

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}
##

variable "AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-02369b909144c4d97"
  }
}

variable "cluster_app" {
  description = "The name to use for all the cluster resources"
  default     = "java1"
}

variable "cluster_vertical" {
  description = "The name to use for all the cluster resources"
  default     = "swoo"
}

variable "cluster_service" {
  description = "The name to use for all the cluster resources"
  default     = "nginx-example"
}

variable "cluster_role" {
  default = "web-service"
}

variable "name_prefix" {
  default = "pl"
}

variable "key_name" {
  default = "virginia-vallabh"
}

variable "security_groups" {
  default = ["sg-0a758f6ef43b54402"]
}

variable "vpc_id" {
  default = "vpc-04adb43ca157c4fdf"
}

variable "subnets" {
  default = ["subnet-0a4ad75dd083c14e7", "subnet-07c7236c3d0d4cdc7"]
}

variable "availability_zones" {
  default = ["us-east-1a", "us-east-1b"]
}


##ALB and ASG Inputs

variable "alb_listener_port" {
  default = "80"
}

variable "alb_listener_protocol" {
  default = "HTTP"
}

variable "alb_name" {
  default = "front-alb"
}

variable "alb_target_group_name" {
  default = "nginx-http"
}

variable "alb_tg_port" {
  default = "80"
}

variable "alb_tg_protocol" {
  default = "HTTP"
}

variable "alb_tg_health_check_path" {
  default = "/"
}


variable "alb_tg_health_check_port" {
  default = "80"
}

variable "alb_tg_health_check_protocol" {
  default = "HTTP"
}

variable "alb_tg_healthy_threshold" {
  default = "2"
}

variable "alb_tg_unhealthy_threshold" {
  default = "2"
}

variable "alb_tg_health_check_interval" {
  default = "6"
}

variable "alb_tg_health_check_timeout" {
  default = "5"
}


##DNS Mapping to LB

variable "route53_zone_id" {
  default = "Z1NS06CH374Q0V"
}

#This will create a A record and maps to LB. 
variable "dns_subdomain" {
  default = "stage-test"
}
