job "j" {
  datacenters = ["dc1"]

  group "group" {
    count = 1

    volume "test" {
      type   = "host"
      source = "/tmp"
    }

    task "task" {
      driver = "raw_exec"

      volume_mount "test" {
	volume = "test"
	destination = "${NOMAD_TASK_DIR}/test"
        read_only   = false
      }

      config {
	command = "/bin/sh"
	args    = ["-c", "touch /local/test/${NOMAD_ALLOC_ID}; sleep 3600"]
      }

      resources {
        cpu    = 20
	memory = 20
      }
    }
  }
}
