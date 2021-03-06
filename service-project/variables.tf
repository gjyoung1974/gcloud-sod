# Variables for "Resource" project

variable project {
  description = "The project ID to host project resources in"
}

variable admin_project {
  description = "The project ID that hosts our IAM and other security sensitive resources"
}

variable "host_network" {
  description = "Network to host our resources"
}

variable name {
  description = "The project name/prefix"
}

variable region {
  description = "The region to host the resources in"
}

variable zone {
  description = "Initial HA zone for resources"
}

variable network_name {
  description = "The VPC network to host the resources in"
}

variable subnetwork {
  description = "The VPC network > subnetwork to host the resources in"
}

variable preemptible {
  description = "Whether the nodes are created as preemptible VM instances"
  default     = false
}

variable disk_size_gb {
  description = "Disk size in GB"
  default     = 75
}

variable local_ssd_count {
  description = "Number of local SSDs"
  default     = "1"
}

variable disk_type {
  description = "Disk Type"
  default     = "pd-ssd"
}

variable machine_type {
  description = "Machine Type"
  default     = "n1-standard-1"
}

variable "image_type" {
  description = "Worker node image Type"
  default     = "COS"
}

variable bastion_image {
  description = "Select a security hardened image for our SSH bastion host"
}

variable min_cpu_platform {
  description = "Select a CPU platform for our compute instances"
  default     = "Intel Skylake"
}

variable bastion_svc_account {
  description = "Set a custom service account for the bastion compute instance"
}

variable "bastion_svc_account_roles" {
  description = "list of IAM roles for bastion instance service account"
  type        = "list"
}

variable bastion_oath_scopes {
  description = "Constrain GCP services scopes for bastion instance."

  default = [
    "https://www.googleapis.com/auth/cloud-platform",
  ]
}

variable "generic_vm_svc_account" {
  description = "Set a custom service account for the generic compute instance"
}

variable "generic_vm_svc_account_roles" {
  description = "list of IAM roles for worker node service account"
  type        = "list"
}

variable "public_key" {
  description = "Include an SSH public key in instance metadata"
}

variable ssh_firewall_rule_name {
  description = "Configure a firewall rule to constrai access to our bastion host"
  default     = "bastion-ssh"
}

variable ssh_source_ranges {
  type        = "list"
  description = "Constrain allowable sources that can connect to the ssh bastion."
}

variable "auto_repair" {
  description = "Whether the nodes will be automatically repaired."
  default     = true
}

variable "workload_metadata_config" {
  description = "Harden the medata service."
  default     = "SECURE"
}
