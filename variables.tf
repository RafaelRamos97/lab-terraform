variable "local" {
  description = "Variavel que indica onde os recursos vão ser criados."
  type        = string
  default     = "us-east-1"
}

variable "cidr-terraform" {
  description = "Indicador do valor de CIDRR"
  type        = string
  default     = "192.168.0.0/24"
}

variable "cidr-terraform-2" {
  description = "Indicador do valor de CIDRR"
  type        = string
  default     = "192.168.1.0/24"
}
