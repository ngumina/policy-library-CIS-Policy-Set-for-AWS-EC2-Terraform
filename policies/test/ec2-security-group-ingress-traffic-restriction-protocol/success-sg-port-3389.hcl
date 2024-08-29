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

param "ensure_no_ingress_to_port_3389_from_unknown_sources" {
  value = true
}

param "prevent_unknown_ipv4_ingress" {
  value = true
}


test {
  rules = {
    main = true
  }
}