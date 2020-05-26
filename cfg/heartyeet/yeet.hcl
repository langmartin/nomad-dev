job "yeet" {
  datacenters = ["dc1"]

  group "group" {
    stop_after_client_disconnect = "5s"
    count                        = 2

    constraint {
      operator = "distinct_hosts"
      value    = "true"
    }

    task "task" {
      driver = "raw_exec"
      kill_timeout = "1s"

      config {
	command = "sleep"
	args    = ["3600"]
      }

      resources {
        cpu    = 20
	memory = 20
      }
    }
  }
}
