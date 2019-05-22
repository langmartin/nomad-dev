# Increase log verbosity
log_level = "DEBUG"

# Setup data dir
data_dir = "./tmp/dev1"

# Enable the client
client {
  enabled = true
}

server {
  enabled = true
  bootstrap_expect = 1
}

plugin "raw_exec" {
  config {
    enabled = true
  }
}

ports {
  http = 7646
}
