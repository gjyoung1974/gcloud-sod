#!/bin/bash

# set some variables:
# export GOOGLE_PROJECT=$(gcloud config get-value project)
export GOOGLE_PROJECT="acme-corp-resource"
export GOOGLE_ADMIN_PROJECT="acme-corp-admin"

# create our variables file:
cat - > terraform.tfvars <<EOF

# project properties
project="${GOOGLE_PROJECT}"
admin_project="${GOOGLE_ADMIN_PROJECT}"
name="${GOOGLE_PROJECT}"
region="us-west2"
zone="us-west2-a"
public_key="gordonyoung:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDZ1qgt675FrD52INApHFfuKUBhCpziWSQlT74iIUf5La+8GWxW5WWIN6qfoHajFvTLlMigzihzA1BnXua38cO0KNdyJFLN9OPRVov96o0q4TTAksLuCT9vXToi9u93ttv1TOyuDMk0qerMmmublsp+0L401Dg0mOa5Hs+3khITfkgLlkCkDfOYqmNY9OjmvW2QhTWUd1HTBFgJSzgQIYGy9rEmnFJ7S3uJM3JP7MlB6LeOsmaaDR8+lhhbZzsBz0gSo/xK7fwUt91csYapSniQVjC4V4PC6oM+S8WVWlEXcgao6uKIZsTgUtRa8cJqgpWIbjZxD7FAMT3rVMAeoRNX gordonyoung"

# bastion host properties
# A marketplace CIS Hardenend image
# bastion_image="projects/cis-public/global/images/cis-ubuntu-linux-1804-level-1-v1-0-0-0" # CIS hardened image
# or select a custom image:
bastion_image="projects/acme-inc-service/global/images/acme-ubuntu-1804-bionic-base-1546542446"
bastion_svc_account="bastion-svc"
bastion_svc_account_roles=["roles/compute.osLogin"]

# generic host properties
generic_vm_svc_account="generic-vm-svc"
generic_vm_svc_account_roles = ["roles/logging.logWriter","roles/logging.viewer"]
generic_vm_image="projects/cis-public/global/images/cis-ubuntu-linux-1804-level-1-v1-0-0-0"

# network properties
ssh_source_ranges=["${MY_PUBLIC_IPV4}/32"]
host_network="projects/acme-inc-host/global/networks/acme-services-net"
network_name="projects/acme-inc-host/global/networks/acme-corp-admin-net"
subnetwork="projects/acme-inc-host/regions/us-west2/subnetworks/acme-services-net"

EOF
