# Increase log verbosity
log_level = "DEBUG"

# Setup data dir
data_dir = "/tmp/nomad-heartyeet/client3"

# Give the agent a unique name. Defaults to hostname
name = "client3"

# Enable debugging
enable_debug = true

datacenter = "dc1"

# Enable the client
client {
  enabled = true
  cpu_total_compute = 501

  server_join {
    retry_join = ["127.0.0.1:4647"]
  }
}

ports {
  http = 9646
}
