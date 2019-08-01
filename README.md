# Overview
This terraform module will deploy chef supermarket to one or more servers
Supported platform families:
 * Debian
 * SLES
 * RHEL

## Usage

```hcl

module "chef_supermaket" {
  source               = "devoptimist/chef-supermarket/linux"
  version              = "0.0.1"
  ips                  = ["172.16.0.23"]
  instance_count       = 1
  ssh_user_name        = "ec2-user"
  ssh_user_private_key = "~/.ssh/id_rsa"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
|ips|A list of ip addresses where the chef supermarket will be installed|list|[]|no|
|instance_count|The number of instances being created| integer |0|no|
|ssh_user_name|The ssh user name used to access the ip addresses provided|string||yes|
|ssh_user_pass|The ssh user password used to access the ip addresses|string|""|no|
|ssh_user_private_ssh_key|The ssh user key used to access the ip addresses|string|""|no|
|channel|The install channel to use for the chef supermarket package|string|stable|no|
|install_version|The version of chef supermarket to install|string|3.3.3|no|
|chef_server_urls|A list of chef server urls used to auth with|list|[]|no|
|chef_oauth2_app_ids| A list of app ids used in authentication with a chef server|list|[]|no|
|chef_oauth2_app_secrets| A list of oauth secrets used in authentication with a chef server|list|[]|no|
|fqdns|A list of fully qualified host names to apply to each chef supermarket being created|list|[]|no|
|certs|A list of ssl certificates to apply to each chef supermarket|list|[]|no|
|cert_keys|A list of ssl private keys to apply to each chef supermarket|list|[]|no|
