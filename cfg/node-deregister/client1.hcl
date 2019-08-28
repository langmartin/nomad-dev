log_level = "DEBUG"
data_dir = "/tmp/nomad/client1"
name = "client1"
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
  http = 4746
  rpc  = 4747
  serf = 4748
}
