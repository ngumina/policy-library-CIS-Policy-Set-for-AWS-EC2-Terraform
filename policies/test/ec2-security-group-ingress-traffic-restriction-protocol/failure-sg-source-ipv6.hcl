mock "tfplan/v2" {
  module {
    source = "./mocks/policy-failure-sg-ipv6-source/mock-tfplan-v2.sentinel"
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

param "prevent_unknown_ipv6_ingress" {
  value = true
}


test {
  rules = {
    main = false
  }
}