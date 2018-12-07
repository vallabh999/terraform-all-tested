variable "name" {
  description = "Vallabh"
}

variable "security_groups" {
  description = "A list of security group IDs to assign to the ELB"
  default = ["sg-0beb2057562e4b6f1"]
}

variable "subnets" {
  description = "A list of subnet IDs to attach to the ELB"
  default        = ["subnet-0bfbee9b969662077", "subnet-056e05dcb6e918f9f"]
}

variable "vpc" {
  description = "VPC"
  default        =  "vpc-0314aeb42c44eca03"
}

variable "internal" {
  description = "If true, ELB will be an internal ELB"
  default = "false"
}

variable "cross_zone_load_balancing" {
  description = "Enable cross-zone load balancing"
  default     = false
}

variable "idle_timeout" {
  description = "The time in seconds that the connection is allowed to be idle"
  default     = 60
}

variable "connection_draining" {
  description = "Boolean to enable connection draining"
  default     = false
}

variable "connection_draining_timeout" {
  description = "The time in seconds to allow for connections to drain"
  default     = 60
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  default     = {
    Owner       = "user"
    Environment = "dev"
}
}

variable "listener" {
   default =  [
     {
      instance_port     = "80"
      instance_protocol = "HTTP"
      lb_port           = "80"
      lb_protocol       = "HTTP"
  },
]
}



variable "access_logs" {
  description = "An access logs block"
  type        = "list"
  default     = []
}

variable "health_check" {
  description = "A health check block"
  default = [
    {
      target              = "HTTP:80/"
      interval            = 30
      healthy_threshold   = 2
      unhealthy_threshold = 2
      timeout             = 5
    },
  ]
}

variable "number_of_instances" {
  description = "Number of instances to attach to ELB"
  default     = 1
}

variable "instances" {
  description = "List of instances ID to place in the ELB pool"
  default     = ["i-025b0fd2b232ba491"]
}
