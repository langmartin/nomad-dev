job "yeet" {
  datacenters = ["dc1"]

  group "group" {
    stop_after_client_disconnect = "30s"
    count                        = 1

    constraint {
      operator = "distinct_hosts"
      value    = "true"
    }

    task "task" {
      driver = "exec"
      kill_timeout = "1s"

      config {
	command = "/bin/sleep"
	args    = ["3600"]
      }

      resources {
        cpu    = 20
	memory = 20
      }
    }
  }
}
