log_level = "DEBUG"
data_dir = "/tmp/nomad-allocfs/client1"
name = "client1"
enable_debug = true
datacenter = "dc1"

plugin "raw_exec" {
  config {
    enabled = true
  }
}

client {
  enabled = true
  cpu_total_compute = 501

  server_join {
    retry_join = ["127.0.0.1:4647"]
  }
}

ports {
  http = 7646
}
