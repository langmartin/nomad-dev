log_level = "DEBUG"
data_dir = "/tmp/nomad-client1"
name = "client1"
datacenter = "dc1"
ports {
  http = 7646
  rpc = 7647
}

client {
  enabled = true
  servers = ["127.0.0.1:4647"]

  datalog = <<EOF
capabilities(client1, water_travel).
EOF
}

plugin "raw_exec" {
  config {
    enabled = true
  }
}
