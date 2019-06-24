consul {
  address    = "127.0.0.1:8503"
  ssl        = true
  verify_ssl = false
}

vault {
  enabled          = false
  address          = "https://***REDACTED***"
  create_from_role = "nomad-cluster"
  token            = "***REDACTED***"
}
