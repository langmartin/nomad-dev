datacenter = "dc1"
log_level = "DEBUG"
data_dir = "/tmp/nomad-agent"

client {
  enabled = true
    options {
      "driver.exec.enabled" = "true"
      "driver.raw_exec.enabled" = "true"
      "driver.docker.enabled" = "true"
    }
}

server {
  enabled = true
  bootstrap_expect = 1
}

