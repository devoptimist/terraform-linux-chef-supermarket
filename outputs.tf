output "ip" {
  value = var.ips
}

output "ssh_user" {
  value = var.ssh_user_name
}

output "supermarket_url" {
  value = data.external.supermarket_details[*].result["supermarket_url"]
}
