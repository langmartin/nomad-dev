log_level = "DEBUG"
data_dir = "/tmp/nomad-client3"
name = "client3"
datacenter = "dc1"
ports {
  http = 9646
  rpc = 9647
}

client {
  enabled = true
  servers = ["127.0.0.1:4647"]

  datalog = <<EOF
capabilities(client3, space_travel).
EOF
}

plugin "raw_exec" {
  config {
    enabled = true
  }
}
