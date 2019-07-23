job "docker.hcl" {
  datacenters = ["dc1"]

  group "all" {
    task "yes" {
      driver = "docker"

      config {
	image = "docker-log-rotation:0.1"
	# logging {
	#   type = "json-file",
	#   config {
	#     max-size = "10m",
	#     max-file = "3",
	#   }
	# }
      }

      resources {
	cpu    = 500
	memory = 256
      }
    }
  }
}
