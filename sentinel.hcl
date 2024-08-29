module "report" {
  source = "./modules/report/report.sentinel"
}

module "tfresources" {
  source = "./modules/tfresources/tfresources.sentinel"
}

policy "ec2-ebs-encryption-enabled" {
  source = "./policies/ec2-ebs-encryption-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "ec2-network-acl" {
  source = "./policies/ec2-network-acl.sentinel"
  enforcement_level = "advisory"
}

policy "ec2-vpc-flow-logging-enabled" {
    source = "./policies/ec2-vpc-flow-logging-enabled.sentinel"
    enforcement_level = "advisory"
}

policy "ec2-vpc-default-security-group-no-traffic" {
    source = "./policies/ec2-vpc-default-security-group-no-traffic.sentinel"
    enforcement_level = "advisory"
}

policy "ec2-metadata-imdsv2-required" {
  source = "./policies/ec2-metadata-imdsv2-required.sentinel"
  enforcement_level = "advisory"
}

policy "ec2-security-group-ipv4-ingress-traffic-restriction" {
  source = "./policies/ec2-security-group-ingress-traffic-restriction.sentinel"
  enforcement_level = "advisory"
  params = {
    prevent_unknown_ipv4_ingress = true
  }
}

policy "ec2-security-group-ipv6-ingress-traffic-restriction" {
  source = "./policies/ec2-security-group-ingress-traffic-restriction.sentinel"
  enforcement_level = "advisory"
  params = {
    prevent_unknown_ipv6_ingress = true
    prevent_unknown_ipv4_ingress = false
  }
}

policy "ec2-security-group-ingress-traffic-restriction-port-22" {
  source = "./policies/ec2-security-group-ingress-traffic-restriction.sentinel"
  enforcement_level = "advisory"
  params = {
    port = 22
  }
}

policy "ec2-security-group-ingress-traffic-restriction-port-3389" {
  source = "./policies/ec2-security-group-ingress-traffic-restriction.sentinel"
  enforcement_level = "advisory"
  params = {
    port = 3389
  }
}