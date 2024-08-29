mock "tfplan/v2" {
  module {
    source = "./mocks/policy-success-sg-port/mock-tfplan-v2.sentinel"
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



test {
  rules = {
    main = true
  }
}