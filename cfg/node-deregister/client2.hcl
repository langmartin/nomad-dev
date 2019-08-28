log_level = "DEBUG"
data_dir = "/tmp/nomad/client2"
name = "client2"
datacenter = "dc1"

client {
  enabled = true
  server_join {
    retry_join = ["127.0.0.1:4647"]
  }
}

plugin "raw_exec" {
  config {
    enabled = true
  }
}

ports {
  http = 4846
  rpc  = 4847
  serf = 4848
}
