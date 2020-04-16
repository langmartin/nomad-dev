log_level = "DEBUG"
data_dir = "/tmp/nomad-client2"
name = "client2"
datacenter = "dc1"
ports {
  http = 8646
  rpc = 8647
}

client {
  enabled = true
  servers = ["127.0.0.1:4647"]

  datalog = <<EOF
capabilities(client2, time_travel).
job_color(A, vermillion)?
EOF
}

plugin "raw_exec" {
  config {
    enabled = true
  }
}
