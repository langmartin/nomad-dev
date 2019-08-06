job "example.nomad" {
  datacenters = ["dc1"]

  group "cache" {

    count = 3

    task "redis" {
      driver = "docker"

      constraint {
	attribute = "${node.unique.name}"
	operator = "distinct_property"
	value = "2"
      } # constraint


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
	  port "db" {}
	}
      }

      service {
	name = "redis-cache"
	tags = ["global", "cache"]
	port = "db"
	check {
	  name     = "alive"
	  type     = "tcp"
	  interval = "10s"
	  timeout  = "2s"
	}
      }
    }
  }
}
