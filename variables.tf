variable "local" {
  description = "Variavel que indica onde os recursos vão ser criados."
  type        = string
  default     = "us-east-1"
}

variable "cidr-terraform" {
  description = "Indicador do valor de CIDR"
  type        = string
  default     = "192.168.0.0/16"
}
