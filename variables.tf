################## connection #####################
variable "ips" {
  description = "A list of ip addresses where the chef supermarket will be installed"
  type        = list
  default     = []
}

variable "instance_count" {
  description = "The number of instances being created"
  type        = number
  default     = 0
}

variable "ssh_user_name" {
  description = "The ssh user name used to access the ip addresses provided" 
  type        = string
}

variable "ssh_user_pass" {
  description = "The ssh user password used to access the ip addresses"
  type        = string
  default     = ""
}

variable "ssh_user_private_key" {
  description = "The ssh user key used to access the ip addresses"
  type        = string
  default     = ""
}

############ policyfile_module ##################
variable "cookbooks" {
  description = "the cookbooks used to deploy chef supermarket"
  default     = {
    "chef_supermarket_wrapper" = "github: 'devoptimist/chef_supermarket_wrapper', tag: 'v0.1.7'",
    "chef-ingredient"          = "github: 'chef-cookbooks/chef-ingredient', tag: 'v3.1.1'"
  }
}

variable "runlist" {
  description = "The chef run list used to deploy chef server"
  type        = list
  default     = ["chef_supermarket_wrapper::default"]
}

################ attribute json ##################

variable "channel" {
  description = "The install channel to use for the chef supermarket package"
  type        = string
  default     = "stable"
}

variable "install_version" {
  description = "The version of chef supermarket to install"
  type        = string
  default     = "3.3.3"
}

variable "chef_server_urls" {
  description = "A list of chef server urls used to auth with"
  type        = list(string)
  default     = []
}

variable "chef_oauth2_app_ids" {
  description = "A list of app ids used in authentication with a chef server"
  type        = list(string)
  default     = []
}

variable "chef_oauth2_secrets" {
  description = "A list of oauth secrets used in authentication with a chef server"
  type        = list(string)
  default     = []
}

variable "fqdns" {
  description = "A list of fully qualified host names to apply to each chef supermarket being created"
  type        = list(string)
  default     = []
}

variable "certs" {
  description = "A list of ssl certificates to apply to each chef supermarket"
  type        = list(string)
  default     = []
}

variable "cert_keys" {
  description = "A list of ssl private keys to apply to each chef supermarket"
  type        = list(string)
  default     = []
}

variable "data_source_script_path" {
  description = "location of a data source script for supermarket details"
  type        = string
  default     = "/var/tmp/supermarket_details.sh"
}
