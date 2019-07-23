datacenter = "dc1"
log_level = "DEBUG"
data_dir = "/tmp/nomad-agent"

client {
  enabled = true
}

server {
  enabled = true
  bootstrap_expect = 1
}

