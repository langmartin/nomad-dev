log_level = "DEBUG"
data_dir = "/tmp/client2"
name = "client2"
enable_debug = true
client {
  enabled = true
  server_join {
    retry_join = ["127.0.0.1:4646"]
  }
}

plugin "raw_exec" {
  config {
    enabled = true
  }
}

ports {
  http = 7647
}
