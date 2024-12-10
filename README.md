# (Beta) Pre-written Sentinel Policies for Center for Internet Security(CIS) AWS EC2 Foundations Benchmark

Pre-written Sentinel policies are ready to use compliance checks for CIS AWS Foundations Benchmarking v1.2, v1.4 and v3.0 to help enable your AWS resources meet industry security standards.

At HashiCorp, we’re committed to making policy management easier for our customers. We understand that developing policies from scratch can be time-consuming and resource-intensive. To address this, we’re introducing our Prewritten Policy Libraries—expertly crafted, ready-to-use policies designed to streamline your compliance processes and enhance security across your infrastructure.

This repository contains several policies designed to accelerate the adoption of the CIS AWS Foundations Benchmark within HCP Terraform. These policies can be utilized to enforce best practices and security standards across your AWS environment.

For more details on how to work with these policies and to understand the Sentinel language and framework, please refer to the [Sentinel documentation](https://developer.hashicorp.com/sentinel/) or the README documentation included with each of the policy [libraries](https://github.com/hashicorp/policy-library-cis-aws-ec2-terraform/tree/main/docs/policies).

## Feedback

We aim to validate the effectiveness of our policies by collecting diverse user feedback and understanding real-world use cases. This input will help refine our policies and enhance their overall impact. 

1. You can submit your feedback via a [public beta survey](https://docs.google.com/forms/d/e/1FAIpQLScswwLMaVaRuYRGJzDjNiycwM4BUa_gAIsAE_zOPdgyFeLXCA/viewform).

2. If you have any issues or enhancement suggestions to the library, please create [a new GitHub issue](https://github.com/hashicorp/policy-library-cis-aws-ec2-terraform/issues/new).

3. Alternatively, we welcome any contributions that improve the impact of this library! To learn more about contributing and suggesting changes to this library, refer to the [contributing guide](https://github.com/hashicorp/policy-library-cis-aws-ec2-terraform/blob/main/CONTRIBUTING.md).

### Policies Included

- AWS EBS volume are encrypted ([docs](https://github.com/hashicorp/policy-library-cis-aws-ec2-terraform/blob/main/docs/policies/ec2-ebs-encryption-enabled.md) | [code](https://github.com/hashicorp/policy-library-cis-aws-ec2-terraform/blob/main/policies/ec2-ebs-encryption-enabled.sentinel))
- Ensure that EC2 Metadata Service only allows IMDSv2 ([docs](https://github.com/hashicorp/policy-library-cis-aws-ec2-terraform/blob/main/docs/policies/ec2-metadata-imdsv2-required.md) | [code](https://github.com/hashicorp/policy-library-cis-aws-ec2-terraform/blob/main/policies/ec2-metadata-imdsv2-required.sentinel))
- AWS EC2 Network Acls should not allow ingress traffic from 0.0.0.0/0 or ::/0 to ports 22 or 3389 ([docs](https://github.com/hashicorp/policy-library-cis-aws-ec2-terraform/blob/main/docs/policies/ec2-network-acl.md) | [code](https://github.com/hashicorp/policy-library-cis-aws-ec2-terraform/blob/main/policies/ec2-network-acl.sentinel))
- AWS Security Group should not allow ingress traffic from 0.0.0.0/0 or ::/0 to port 22 ([docs](https://github.com/hashicorp/policy-library-cis-aws-ec2-terraform/blob/main/docs/policies/ec2-security-group-ingress-traffic-restriction-port-22.md) | [code](https://github.com/hashicorp/policy-library-cis-aws-ec2-terraform/blob/main/policies/ec2-security-group-ingress-traffic-restriction-port.sentinel))
- AWS Security Group should not allow ingress traffic from 0.0.0.0/0 or ::/0 to port 3389 ([docs](https://github.com/hashicorp/policy-library-cis-aws-ec2-terraform/blob/main/docs/policies/ec2-security-group-ingress-traffic-restriction-port-3389.md) | [code](https://github.com/hashicorp/policy-library-cis-aws-ec2-terraform/blob/main/policies/ec2-security-group-ingress-traffic-restriction-port.sentinel))
- AWS Security Group should not allow ingress traffic from 0.0.0.0/0 to port 22 and 3389 ([docs](https://github.com/hashicorp/policy-library-cis-aws-ec2-terraform/blob/main/docs/policies/ec2-security-group-ipv4-ingress-traffic-restriction.md) | [code](https://github.com/hashicorp/policy-library-cis-aws-ec2-terraform/blob/main/policies/ec2-security-group-ingress-traffic-restriction-protocol.sentinel))
- AWS Security Group should not allow ingress traffic from ::/0 to port 22 and 3389 ([docs](https://github.com/hashicorp/policy-library-cis-aws-ec2-terraform/blob/main/docs/policies/ec2-security-group-ipv6-ingress-traffic-restriction.md) | [code](https://github.com/hashicorp/policy-library-cis-aws-ec2-terraform/blob/main/policies/ec2-security-group-ingress-traffic-restriction-protocol.sentinel))
- EC2 VPC Default Security Group No Traffic ([docs](https://github.com/hashicorp/policy-library-cis-aws-ec2-terraform/blob/main/docs/policies/ec2-vpc-default-security-group-no-traffic.md) | [code](https://github.com/hashicorp/policy-library-cis-aws-ec2-terraform/blob/main/policies/ec2-vpc-default-security-group-no-traffic.sentinel))
- EC2 VPC Flow Logging Enabled ([docs](https://github.com/hashicorp/policy-library-cis-aws-ec2-terraform/blob/main/docs/policies/ec2-vpc-flow-logging-enabled.md) | [code](https://github.com/hashicorp/policy-library-cis-aws-ec2-terraform/blob/main/policies/ec2-vpc-flow-logging-enabled.sentinel))

## Getting Started

This getting started guide assumes that:

1. You are familiar with core workflows in HCP Terraform and Terraform Enterprise, and you have an existing workspace configured with AWS access credentials.

2. You have a user account that is part of the ["owners"](https://developer.hashicorp.com/terraform/cloud-docs/users-teams-organizations/permissions#organization-owners) team or have ["Manage Policies"](https://developer.hashicorp.com/terraform/cloud-docs/users-teams-organizations/permissions#manage-policies) organization-level permissions to create new policy sets and policies.

3. You are using HCP Terraform or Terraform Enterprise [v202406-1](https://developer.hashicorp.com/terraform/enterprise/releases/2024/v202406-1) or a later version.

4. You are using Sentinel version 0.26.x and later version.

By default, all the policies within the library will be enforced by the HCP Platform with the `enforcement_level` set to `advisory` only.

**Example:**
```
policy "iam-password-expiry" {
  source = "./policies/iam-password-expiry.sentinel"
  enforcement_level = "advisory"
   params = {
      password_expiry_days = 90
   }
}
```

If you want to change the [enforcement levels](https://developer.hashicorp.com/sentinel/docs/concepts/enforcement-levels) to either `soft-mandatory` or `hard-mandatory`, we recommend updating the contents of the `sentinel.hcl` file in each library before applying the Terraform configuration.

> **Important:**
The policies in each library are opinionated and [Sentinel module](https://developer.hashicorp.com/sentinel/docs/extending/modules) documentation.
>
To learn more about how to configure a policy set as a [policy evaluation](https://developer.hashicorp.com/terraform/cloud-docs/policy-enforcement/manage-policy-sets#policy-evaluations), please review the Terraform Enterprise provider [documentation](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/policy_set#agent_enabled).

## Resources

- [Get Started - HCP Terraform](https://developer.hashicorp.com/terraform/tutorials/cloud-get-started)
- [Connecting VCS Providers to HCP Terraform](https://developer.hashicorp.com/terraform/cloud-docs/vcs)
- [Policy Enforcement](https://developer.hashicorp.com/terraform/cloud-docs/policy-enforcement)
- [Managing Policy Sets](https://developer.hashicorp.com/terraform/cloud-docs/policy-enforcement/manage-policy-sets)
- [Introduction to Sentinel](https://developer.hashicorp.com/sentinel/intro/what)
- [Sentinel Documentation](https://developer.hashicorp.com/sentinel/docs)
- [Sentinel Language](https://developer.hashicorp.com/sentinel/docs/language/)
- [Sentinel Language Specification](https://developer.hashicorp.com/sentinel/docs/language/spec)
- [Policy Libraries](https://registry.terraform.io/browse/policies)
