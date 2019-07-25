################## connection #####################
variable "ips" {
  type    = list
  default = []
}

variable "instance_count" {
  default = 0
}

variable "ssh_user_name" {
  type    = string
  default = "chefuser"
}

variable "ssh_user_pass" {
  type    = string
  default = "P@55w0rd1"
}

variable "ssh_user_private_key" {
  type    = string
  default = ""
}


############ policyfile_module ##################
variable "cookbooks" {
  default = {
    "chef_supermarket_wrapper" = "github: 'devoptimist/chef_supermarket_wrapper', tag: 'v0.1.7'",
    "chef-ingredient" = "github: 'chef-cookbooks/chef-ingredient', tag: 'v3.1.1'"
  }
}

variable "runlist" {
  type    = list
  default = ["chef_supermarket_wrapper::default"]
}

################ attribute json ##################

variable "channel" {
  type    = string
  default = "stable"
}

variable "install_version" {
  type    = string
  default = "3.3.3"
}

variable "chef_server_urls" {
  type    = list(string)
  default = []
}

variable "chef_oauth2_app_ids" {
  type    = list(string)
  default = []
}

variable "chef_oauth2_secrets" {
  type    = list(string)
  default = []
}

variable "fqdns" {
  type    = list(string)
  default = []
}

variable "certs" {
  type    = list(string)
  default = []
}

variable "cert_keys" {
  type    = list(string)
  default = []
}

variable "data_source_script_path" {
  type    = string
  default = "/var/tmp/supermarket_details.sh"
}
