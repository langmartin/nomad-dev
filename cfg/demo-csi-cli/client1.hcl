# Increase log verbosity
log_level = "DEBUG"

# Setup data dir
data_dir = "/tmp/nomad-csi/client1"

# Give the agent a unique name. Defaults to hostname
name = "client1"

# Enable debugging
enable_debug = true

datacenter = "dc1"

# Enable the client
client {
  enabled = true

  server_join {
    retry_join = ["127.0.0.1:4647"]
  }
}

ports {
  http = 7646
}
