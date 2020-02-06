job "job.hcl" {
  datacenters = ["dc1"]
  type = "system"
  priority = 1

  group "all" {
    count = 1

    task "low" {
      driver = "raw_exec"

      config {
	command = "/bin/sleep"
	args = ["3000000"]
      }

      resources {
        cpu    = 20
        memory = 20
      }
    }
  }
}
