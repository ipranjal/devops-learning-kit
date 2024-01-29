variable "name" {
  description = "Name to be used on all the resources as identifier"
  default     = "dev"
}

variable "project_name" {
  description = "Name to be used on all the resources as identifier"
  default     = "vpc"
}

variable "cluster_name" {
  description = "Name of the eks cluster"
  default     = "dev"
}

variable "region" {
  description = "region to be used"
  default     = "eu-central-1"
}

variable "azs" {
  description = "A list of availability zones in the region"
  default     = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  default     = false
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  default     = true
}

variable "assign_generated_ipv6_cidr_block" {
  description = "Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC. You cannot specify the range of IP addresses, or the size of the CIDR block"
  default     = false
}

variable "public_subnet_suffix" {
  description = "Suffix to append to public subnets name"
  default     = "public"
}


variable "private_subnet_suffix" {
  description = "Suffix to append to private subnets name"
  default     = "private"
}

variable "database_subnet_suffix" {
  description = "Suffix to append to database subnets name"
  default     = "db"
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  default     = ["10.0.8.0/24", "10.0.9.0/24", "10.0.10.0/24"]
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  default     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
}

variable "database_subnets" {
  type        = list(string)
  description = "A list of database subnets"
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "map_public_ip_on_launch" {
  description = "Should be false if you do not want to auto-assign public IP on launch"
  default     = true
}

variable "propagate_private_route_tables_vgw" {
  description = "Should be true if you want route table propagation"
  default     = false
}

variable "propagate_public_route_tables_vgw" {
  description = "Should be true if you want route table propagation"
  default     = false
}

variable "dhcp_options_domain_name_servers" {
  description = "Specify a list of DNS server addresses for DHCP options set, default to AWS provided"
  type        = list(string)
  default     = ["AmazonProvidedDNS"]
}

variable "dhcp_options_ntp_servers" {
  description = "Specify a list of NTP servers for DHCP options set"
  type        = list(string)
  default     = []
}

variable "reuse_nat_ips" {
  description = "Should be true if you don't want EIPs to be created for your NAT Gateways and will instead pass them in via the 'external_nat_ip_ids' variable"
  default     = false
}

variable "external_nat_ip_ids" {
  description = "List of EIP IDs to be assigned to the NAT Gateways (used in combination with reuse_nat_ips)"
  type        = list(string)
  default     = []
}

variable "common_tags" {
  type        = map(string)
  description = "These tags will be appended to all resources created by terraform"
  default = {
    "Project"     = "base-networking"
    "Environment" = "dev"
    "Provisioner" = "terraform"
  }
}

