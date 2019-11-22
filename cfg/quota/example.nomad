job "example" {
  datacenters = ["dc1"]
  region = "global"

  group "cache" {
    task "redis" {
      driver = "raw_exec"

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
