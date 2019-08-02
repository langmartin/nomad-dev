job "client-cpu.hcl" {
  datacenters = ["dc1"]
  type = "service"

  group "all" {
    count = 10

    task "low" {
      driver = "raw_exec"

      config {
	command = "/bin/sleep"
	args = ["10000000"]
      }
    }
  }
}
