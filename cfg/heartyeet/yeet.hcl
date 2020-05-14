job "yeet" {
  datacenters = ["dc1"]

  group "cache" {
    stop_after_client_disconnect = "20s"

    count = 2

    task "redis" {
      driver = "docker"

      config {
        image = "redis:3.2"

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
