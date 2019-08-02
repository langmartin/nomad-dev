job "docker.hcl" {
  datacenters = ["dc1"]

  group "cache" {
    task "redis" {
      driver = "docker"

      config {
        image = "docker-log-rotation:0.1"
      }

      resources {
        cpu    = 500
        memory = 256
      }
    }
  }
}
