log_level = "DEBUG"
data_dir = "/tmp/nomad-allocfs/server1"
name = "server1"

server {
  enabled = true
  bootstrap_expect = 1
}
