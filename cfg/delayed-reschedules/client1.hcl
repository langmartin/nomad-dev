log_level = "DEBUG"
data_dir = "/tmp/nomad-delayed-reschedules/client1"
name = "client1"
datacenter = "dc1"

client {
  enabled = true

  server_join {
    retry_join = ["127.0.0.1:4647"]
  }
}

ports {
  http = 7646
}
