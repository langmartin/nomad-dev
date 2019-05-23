datacenter = "dc1"

# Increase log verbosity
log_level = "DEBUG"

# Setup data dir
data_dir = "/tmp/server1"

# Give the agent a unique name. Defaults to hostname
name = "server1"

# Enable the server
server {
  enabled = true

  # Self-elect, should be 3 or 5 for production
  bootstrap_expect = 1
}

vault {
  enabled          = true
  allow_unauthenticated = true
  address          = "http://127.0.0.1:8200"
  create_from_role = "nomad-cluster"
  task_token_ttl   = "5m"
}
