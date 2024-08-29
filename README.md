# AWS Cloudtrail Sentinel Policies for Terraform
This library, provides prescriptive Terraform policies that can be used to establish secure Terraform configuration for Amazon Web Services. The policies that are contained in this library are based on the [CIS Amazon Web Services Benchmarks](https://www.cisecurity.org/benchmark/amazon_web_services). Terraform Cloud/Enterprise users can use the policies in this library to establish a foundational level of security for the services that they are adopting in Amazon Web Services.

> **NOTE:**
>
> This Policy Library is not an exhaustive list of all of possible security configurations and architecture that is available in Amazon Web Services. If you have questions, comments, or have identified ways for us to improve this library, please create [a new GitHub issue](https://github.com/hashicorp/policy-library-aws-networking-terraform/issues/new/choose).
>
> Alternatively, We welcome any contributions that improve the quality of this library! To learn more about contributing and suggesting changes to this library, refer to the [contributing guide](https://github.com/hashicorp/policy-library-aws-networking-terraform/blob/main/CONTRIBUTING.md).

---

## Policies included

-  Ensure no security groups allow ingress from 0.0.0.0/0 to port 22 ([docs](https://github.com/hashicorp/policy-library-aws-networking-terraform/blob/main/docs/policies/deny-public-ssh-acl-rules.md) | [code](https://github.com/hashicorp/policy-library-aws-networking-terraform/blob/main/policies/deny-public-ssh-acl-rules/deny-public-ssh-acl-rules.sentinel))
-  Ensure no security groups allow ingress from 0.0.0.0/0 to port 3389 ([docs](https://github.com/hashicorp/policy-library-aws-networking-terraform/blob/main/docs/policies/deny-public-rdp-acl-rules.md) | [code](https://github.com/hashicorp/policy-library-aws-networking-terraform/blob/main/policies/deny-public-rdp-acl-rules/deny-public-rdp-acl-rules.sentinel))
-  Ensure the default security group of every VPC restricts all traffic ([docs](https://github.com/hashicorp/policy-library-aws-networking-terraform/blob/main/docs/policies/restrict-all-vpc-traffic-acl-rules.md) | [code](https://github.com/hashicorp/policy-library-aws-networking-terraform/blob/main/policies/restrict-all-vpc-traffic-acl-rules/restrict-all-vpc-traffic-acl-rules.sentinel))

---


## Testing policies

To test these policies, please do the following:

- Download the Sentinel CLI from the [Sentinel Downloads](https://docs.hashicorp.com/sentinel/install) page.
- Unzip the zip file and place the sentinel binary in your path.
- Clone this repository to your local machine.
- Run `make tests` to test all policies. These policies will run against mocks that are present in `policies/test/*/mocks` directory.
- If you just want to test a single policy, run `make test`

## Development

We have the following `make` targets to facilitate development and testing of these policies

```bash
make fmt # Format *.sentinel files in the codebase.
make tests # Runs sentinel unit tests against all the policies.
make generate-policy name=test-policy # Creates a boilerplate template according to best practices to get started with authoring policies
```

## Note :- 

### Policies supported via Sentinel

The following CIS standards have equivalent Sentinel policies written for them. These policies get enforced between the `plan` and `apply` phase whenever a run gets queued in TFC/TFE.

- [cloudtrail-bucket-access-logging-enabled](./docs/policies/cloudtrail-bucket-access-logging-enabled.md)
- [cloudtrail-cloudwatch-logs-group-arn-present](./docs/policies/cloudtrail-cloudwatch-logs-group-arn-present.md)
- [cloudtrail-log-file-validation-enabled](./docs/policies/cloudtrail-log-file-validation-enabled.md)
- [cloudtrail-logs-bucket-not-public](./docs/policies/cloudtrail-logs-bucket-not-public.md)
- [cloudtrail-server-side-encryption-enabled](./docs/policies/cloudtrail-server-side-encryption-enabled.md)
- [ec2-ebs-encryption-enabled](./docs/policies/ec2-ebs-encryption-enabled.md)
- [ec2-network-acl](./docs/policies/ec2-network-acl.md)
- [ec2-vpc-default-security-group-no-traffic](./docs/policies/ec2-vpc-default-security-group-no-traffic.md)
- [ec2-vpc-flow-logging-enabled](./docs/policies/ec2-vpc-flow-logging-enabled.md)
- [iam-no-admin-privileges-allowed-by-policies](./docs/policies/iam-no-admin-privileges-allowed-by-policies.md)
- [iam-password-length](./docs/policies/iam-password-length.md)
- [iam-password-reuse](./docs/policies/iam-password-reuse.md)
- [kms-key-rotation-enabled](./docs/policies/kms-key-rotation-enabled.md)
- [rds-encryption-at-rest-enabled](./docs/policies/rds-encryption-at-rest-enabled.md)
- [s3-block-public-access-account-level](./docs/policies/s3-block-public-access-account-level.md)
- [s3-block-public-access-bucket-level](./docs/policies/s3-block-public-access-bucket-level.md)
- [s3-require-mfa-delete](./docs/policies/s3-require-mfa-delete.md)
- [s3-require-ssl](./docs/policies/s3-require-ssl.md)


### Policies supported via Terraform configs

Sentinel policies are only enforced in the context of a given Terraform run. The following CIS standards can't be implemented directly using Sentinel because the evaluation result of such policies depends on the remote state of resources present in AWS. To remediate such violations, we added the following terraform configs which when applied guarantees compliance against a specific CIS standard.

- [aws-config-enabled](./docs/manual-policies/aws-config-enabled.md)
- [cloudtrail-atleast-one-multiregion-trail](./docs/manual-policies/cloudtrail-atleast-one-multiregion-trail.md)
- [cloudwatch-log-metric-alarm-for-aws-config-change](./docs/manual-policies/cloudwatch-log-metric-alarm-for-aws-config-change.md)
- [cloudwatch-log-metric-alarm-for-changes-in-network-acl-lists](./docs/manual-policies/cloudwatch-log-metric-alarm-for-changes-in-network-acl-lists.md)
- [cloudwatch-log-metric-alarm-for-changes-to-network-gateways](./docs/manual-policies/cloudwatch-log-metric-alarm-for-changes-to-network-gateways.md)
- [cloudwatch-log-metric-alarm-for-cloudtrail-config-change](./docs/manual-policies/cloudwatch-log-metric-alarm-for-cloudtrail-config-change.md)
- [cloudwatch-log-metric-alarm-for-console-auth-failures](./docs/manual-policies/cloudwatch-log-metric-alarm-for-console-auth-failures.md)
- [cloudwatch-log-metric-alarm-for-disabling-deletion-customer-keys](./docs/manual-policies/cloudwatch-log-metric-alarm-for-disabling-deletion-customer-keys.md)
- [cloudwatch-log-metric-alarm-for-iam-policy-changes](./docs/manual-policies/cloudwatch-log-metric-alarm-for-iam-policy-changes.md)
- [cloudwatch-log-metric-alarm-for-root-user](./docs/manual-policies/cloudwatch-log-metric-alarm-for-root-user.md)
- [cloudwatch-log-metric-alarm-for-route-table-changes](./docs/manual-policies/cloudwatch-log-metric-alarm-for-route-table-changes.md)
- [cloudwatch-log-metric-alarm-for-s3-bucket-policy-changes](./docs/manual-policies/cloudwatch-log-metric-alarm-for-s3-bucket-policy-changes.md)
- [cloudwatch-log-metric-alarm-for-security-group-changes](./docs/manual-policies/cloudwatch-log-metric-alarm-for-security-group-changes.md)
- [cloudwatch-log-metric-alarm-for-vpc-changes](./docs/manual-policies/cloudwatch-log-metric-alarm-for-vpc-changes.md)
- [iam-access-keys-ninety-days-old-or-more](./docs/manual-policies/iam-access-keys-ninety-days-old-or-more.md)
- [iam-support-role-enabled](./docs/manual-policies/iam-support-role-enabled.md)


### Unsupported policies

The following policies are not supported because they currently cant be implemented using Sentinel policies or manually applying terraform configs.

| Policy                                  | Reason                                                                                                                   |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| IAM root user access key (IAM.4)       |  Root user can't be detected using terraform.                                      |
| MFA for IAM users with console password (IAM.5) | Requires lot of manual and interactive steps. Can't fully achieve this using terraform. |
| Hardware MFA for root user (IAM.6)     | We have no means to detect root user using terraform hence not implementing this.                                        |
| MFA for root user (IAM.9)              | Root user information is not available via terraform.                                                          |
| Unused IAM user credentials (IAM.22)   | This needs Access key age, Password age, and Last activity column values which is not available with terraform provider for iam-access-keys. |
