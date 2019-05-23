# Increase log verbosity
log_level = "DEBUG"

# Setup data dir
data_dir = "/tmp/client1"

# Give the agent a unique name. Defaults to hostname
name = "client1"

# Enable the client
client {
  enabled = true
  server_join {
    retry_join = ["127.0.0.1:4647"]
  }
}

datacenter = "dc1"

vault {
  enabled          = true
  allow_unauthenticated = true
  address          = "http://127.0.0.1:8200"
  create_from_role = "nomad-cluster"
  task_token_ttl   = "2m"
}

plugin "raw_exec" {
  config {
    enabled = true
  }
}

ports {
  http = 7646
}
