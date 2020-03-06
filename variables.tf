variable "gcp_project" {
  description = "The name of the GCP project to create all resources"
}

variable "zone" {
  type = string
}

variable "cluster_name" {
  description = "Name of the K8s cluster"
}

variable "parent_domain" {
  description = "The parent domain to be allocated to the cluster"
}

// ----------------------------------------------------
variable "velero_namespace" {
  default = "velero"
}

variable "velero_schedule" {
  description = "The parent domain to be allocated to the cluster - check https://github.com/jenkins-x/jenkins-x-boot-config/blob/master/systems/velero-backups/templates/default-backup.yaml for defaults"
  default     = "0 * * * *"
}

variable "velero_ttl" {
  description = "The time allocated that defines the lifetime of a velero backup - check https://github.com/jenkins-x/jenkins-x-boot-config/blob/master/systems/velero-backups/templates/default-backup.yaml for defaults"
  default     = "720h0m0s"
}

variable "version_stream_ref" {
  default = "master"
}

variable "version_stream_url" {
  default = "https://github.com/jenkins-x/jenkins-x-versions.git"
}

variable "webhook" {
  default = "prow"
}
