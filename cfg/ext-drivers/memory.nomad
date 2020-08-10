job "memory" {
  datacenters = ["dc1"]
  group "echo" {
    count = 1
    task "server" {
      driver = "podman"
      config {
	image = "hashicorp/http-echo:latest"
	args = [
	  "-listen", ":8080",
	  "-text", "Hello and welcome to ${NOMAD_IP_http} running on port 8080",
	]
	# memory_hard_limit = 200
      }

      resources {
	memory = 100
	network {
	  port "http" {
	    static = 8080
	  }
	}
      }
    }
  }
}
