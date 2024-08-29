mock "tfplan/v2" {
  module {
    source = "./mocks/policy-failure-sg-ingress-protocol/mock-tfplan-v2.sentinel"
  }
}

import "plugin" "tfresources" {
  source = "../../../plugins/darwin/arm64/sentinel-plugin-tfresources"
}

mock "report" {
  module {
    source = "../../../modules/mocks/report/report.sentinel"
  }
}

param "prevent_unknown_ipv4_ingress" {
  value = true
}

param "port" {
  value = 22
}

test {
  rules = {
    main = false
  }
}