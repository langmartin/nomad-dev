vault {
  enabled          = true
  ca_path          = "/etc/certs/ca"
  cert_file        = "/var/certs/vault.crt"
  key_file         = "/var/certs/vault.key"
  address          = "http://vault.service.consul:8200"
  create_from_role = "nomad-cluster"
}
