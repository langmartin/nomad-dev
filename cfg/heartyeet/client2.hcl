# Increase log verbosity
log_level = "DEBUG"

# Setup data dir
data_dir = "/tmp/nomad-heartyeet/client2"

# Give the agent a unique name. Defaults to hostname
name = "client2"

# Enable debugging
enable_debug = true

datacenter = "dc1"

advertise {
  http = "127.0.0.3"
  rpc = "127.0.0.3"
  serf = "127.0.0.3"
}

# Enable the client
client {
  enabled = true
  cpu_total_compute = 501

  server_join {
    retry_join = ["127.0.0.1:4647"]
  }
}
