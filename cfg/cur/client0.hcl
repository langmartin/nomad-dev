
log_level = "DEBUG"
data_dir = "/tmp/client0"
name = "client0"
enable_debug = true
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
  http = 7646
}

