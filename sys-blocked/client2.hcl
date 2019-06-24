# Increase log verbosity
log_level = "DEBUG"

# Setup data dir
data_dir = "/tmp/client2"

# Give the agent a unique name. Defaults to hostname
name = "client2"

# Enable debugging
enable_debug = true

# Enable the client
client {
  enabled = true
  server_join {
    retry_join = ["127.0.0.1:4647"]
  }
  memory_total_mb = 30
}

plugin "raw_exec" {
  config {
    enabled = true
  }
}

ports {
  http = 8646
}
