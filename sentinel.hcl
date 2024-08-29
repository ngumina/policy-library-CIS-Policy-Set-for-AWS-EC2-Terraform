module "tfplan-functions" {
  source = "./modules/tfplan-functions/tfplan-functions.sentinel"
}

module "tfconfig-functions" {
  source = "./modules/tfconfig-functions/tfconfig-functions.sentinel"
}

module "report" {
  source = "./modules/report/report.sentinel"
}

import "plugin" "tfplan/v2" {
  config = {
    "plan_path": "./plan.json"
  }
}

import "plugin" "tfconfig/v2" {
  config = {
    "path": "./plan.json"
  }
}

sentinel {
  features = {
    apply-all = true
    terraform = true
  }
}

import "plugin" "tfresources" {
  source = "./plugins/darwin/arm64/sentinel-plugin-tfresources"
}

policy "rds-encryption-at-rest-enabled" {
  source = "./policies/rds-encryption-at-rest-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "ec2-ebs-encryption-enabled" {
  source = "./policies/ec2-ebs-encryption-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "s3-block-public-access-account-level" {
    source = "./policies/s3-block-public-access-account-level.sentinel"
    enforcement_level = "advisory
}

policy "ec2-network-acl" {
  source = "./policies/ec2-network-acl.sentinel"
  enforcement_level = "advisory"
}

policy "s3-require-ssl" {
  source = "./policies/s3-require-ssl.sentinel"
  enforcement_level = "advisory"
}

policy "s3-require-mfa-delete" {
  source = "./policies/s3-require-mfa-delete.sentinel"
  enforcement_level = "advisory"
}

policy "s3-block-public-access-bucket-level" {
    source = "./policies/s3-block-public-access-bucket-level.sentinel"
    enforcement_level = "advisory"
}

policy "cloudtrail-server-side-encryption-enabled" {
    source = "./policies/cloudtrail-server-side-encryption-enabled.sentinel"
    enforcement_level = "advisory"
}

policy "cloudtrail-log-file-validation-enabled" {
    source = "./policies/cloudtrail-log-file-validation-enabled.sentinel"
    enforcement_level = "advisory"
}

policy "cloudtrail-cloudwatch-logs-group-arn-present" {
  source = "./policies/cloudtrail-cloudwatch-logs-group-arn-present.sentinel"
  enforcement_level = "advisory"
}

policy "cloudtrail-logs-bucket-not-public" {
  source = "./policies/cloudtrail-logs-bucket-not-public.sentinel"
  enforcement_level = "advisory"
}

policy "cloudtrail-bucket-access-logging-enabled" {
  source = "./policies/cloudtrail-bucket-access-logging-enabled.sentinel"
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

policy "iam-no-admin-privileges-allowed-by-policies" {
    source = "./policies/iam-no-admin-privileges-allowed-by-policies.sentinel"
    enforcement_level = "advisory"
}

policy "iam-password-length" {
  source = "./policies/iam-password-length.sentinel"
  enforcement_level = "advisory"
   params = {
      password_length = 14
   }
}

policy "iam-password-reuse" {
  source = "./policies/iam-password-reuse.sentinel"
  enforcement_level = "advisory"
   params = {
     allowed_password_reuse_limit = 24
   }
}

policy "kms-key-rotation-enabled" {
    source = "./policies/kms-key-rotation-enabled.sentinel"
    enforcement_level = "advisory"
}
