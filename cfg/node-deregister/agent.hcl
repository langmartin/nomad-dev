datacenter = "dc1"
log_level = "DEBUG"
data_dir = "/tmp/nomad-agent"

client {
  enabled = true
    options {
      "driver.exec.enable" = "1"
      "driver.raw_exec.enable" = "1"
      "driver.docker.enable" = "1"
    }
}

server {
  enabled = true
  bootstrap_expect = 1
}
