log_level = "DEBUG"
data_dir = "/tmp/nomad-delayed-reschedules/server1"
name = "server1"

server {
  enabled = true
  bootstrap_expect = 1
}
