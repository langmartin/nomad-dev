job "system.hcl" {
  datacenters = ["dc1"]
  type = "system"

  group "all" {
    task "low" {
      driver = "raw_exec"

      config {
	command = "/bin/sleep"
	args = ["3000001"]
      }

      resources {
        cpu    = 20
        memory = 20
      }
    }
  }
}
