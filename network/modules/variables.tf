variable "env" {
  type = string
  default = null
}

variable "project_id" {
  type = string
  default = null
}

variable "region" {
  type = string
  default = null
}

variable "network" {
  type = string
  default = null
}

variable "service_account" {
  type = string
  default = null
  sensitive = true
}

