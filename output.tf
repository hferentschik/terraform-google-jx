output "gcp_project" {
  value = var.gcp_project
}

output "zone" {
  value = var.zone
}

output "cluster_name" {
  value = var.cluster_name
}

output "log_storage_url" {
  value = module.jx.log_storage_url
}

output "report_storage_url" {
    value = module.jx.report_storage_url
}

output "repository_storage_url" {
    value = module.jx.repository_storage_url
}
