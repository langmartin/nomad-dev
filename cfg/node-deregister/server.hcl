log_level = "DEBUG"
data_dir = "/tmp/nomad/server1"
name = "server1"
datacenter = "dc1"

plugin "raw_exec" {
  config {
    enabled = true
  }
}

server {
  enabled = true
  node_gc_threshold = "15s"
  bootstrap_expect = 1
}
