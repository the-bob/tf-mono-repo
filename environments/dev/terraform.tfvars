name        = "acmecorp"
environment = "dev"
region      = "eu-north-1"

## Network Specific
cidr             = "10.1.0.0/16"
private_subnets  = ["10.1.4.0/23", "10.1.6.0/23", "10.1.8.0/23"]
public_subnets   = ["10.1.0.0/24", "10.1.1.0/24", "10.1.2.0/24"]
database_subnets = ["10.1.10.0/23", "10.1.18.0/23", "10.1.16.0/23"]

# This Can be The VPN or the Public IP of the office/location
acmecorp_access_cidr = "0.0.0.0/0"
# EKS API Endpoint Access.
admin_cidr_blocks = [acmecorp_access_cidr]

## Instance Sizing (This Can differ Per Env)
# elasticache
node_type = "cache.t3.small"
# eks
instance_types = ["t3.medium"]

## Domain Names
domain_name          = "dev.acmecorpresearch.com"
domain_name_internal = "internal.dev.acmecorpresearch.com"