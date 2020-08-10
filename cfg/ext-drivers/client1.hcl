log_level = "DEBUG"
data_dir = "/tmp/nomad-ext-drivers/client1"
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

plugin_dir = "/home/ec2-user/plugins"
plugin "podman" {
  enabled = true
}
