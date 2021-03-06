job "logmon" {
  datacenters = ["dc1"]

  group "cache" {
    task "redis" {
      driver = "podman"

      config {
        image = "docker://redis:3.2"

        port_map {
          db = 6379
        }
      }

      resources {
        cpu    = 500
        memory = 256

        network {
          mbits = 10
          port  "db"  {}
        }
      }
    }
  }
}
