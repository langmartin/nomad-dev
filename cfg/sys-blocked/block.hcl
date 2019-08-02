job "block.hcl" {
  datacenters = ["dc1"]
  type = "service"

  group "all" {
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
