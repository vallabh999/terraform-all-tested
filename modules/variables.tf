variable "name" {
  description = "Vallabh"
}

variable "security_groups" {
  description = "A list of security group IDs to assign to the ELB"
  default = ["sg-0dc88cea27c6cf9af"]
}

variable "subnets" {
  description = "A list of subnet IDs to attach to the ELB"
  default        = ["subnet-0813312c99a86e05e", "subnet-0fef478f688bbb239"]
}

variable "internal" {
  description = "If true, ELB will be an internal ELB"
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
  default     = ["i-0e1e80b771f89dba7"]
}
