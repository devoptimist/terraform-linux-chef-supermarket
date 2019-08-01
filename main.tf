locals {
  instance_count = var.instance_count # lenght(var.ips)
  dna = [
    for ip in var.ips :
    {
      "supermarket_wrapper" = {
        "details_script_path"  = var.data_source_script_path,
        "package_repo"         = var.channel,
        "package_version"      = var.install_version,
        "fqdn"                 = length(var.fqdns) != 0 ? var.fqdns[index(var.ips, ip)] : "",
        "cert"                 = length(var.certs) != 0 ? var.certs[index(var.ips, ip)] : "", 
        "cert_key"             = length(var.cert_keys) != 0 ? var.cert_keys[index(var.ips, ip)] : ""
      }
    }
  ]
  module_inputs = [
    for ip in var.ips :
    {
      "supermarket_wrapper" = {
        "chef_server_url"      = length(var.chef_server_urls) != 0 ? var.chef_server_urls[index(var.ips, ip)] : "",
        "chef_oauth2_app_id"   = length(var.chef_oauth2_app_ids) != 0 ? var.chef_oauth2_app_ids[index(var.ips, ip)] : "",
        "chef_oauth2_secret"   = length(var.chef_oauth2_secrets) != 0 ? var.chef_oauth2_secrets[index(var.ips, ip)] : "",

      }
    }
  ]
}

module "supermarket_build" {
  source            = "/home/steveb/workspace/terraform/modules/devoptimist/terraform-chef-policyfile"
  ips               = var.ips  
  instance_count    = local.instance_count
  dna               = local.dna
  module_inputs     = local.module_inputs
  cookbooks         = var.cookbooks 
  runlist           = var.runlist
  user_name         = var.ssh_user_name
  user_pass         = var.ssh_user_pass
  user_private_key  = var.ssh_user_private_key
}

data "external" "supermarket_details" {
  count = local.instance_count
  program = ["bash", "${path.module}/files/data_source.sh"]
  depends_on = ["module.supermarket_build"]

  query = {
    ssh_user              = var.ssh_user_name
    ssh_key               = var.ssh_user_private_key
    ssh_pass              = var.ssh_user_pass
    target_ip             = var.ips[count.index]
    target_script         = var.data_source_script_path
  }
}
