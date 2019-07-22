job "raw_exec.hcl" {
  datacenters = ["dc1"]
  type = "service"
  group "test" {
    count = 2
    ephemeral_disk {
      size = "101"
    }
    task "sleep" {
      driver = "exec"
      config {
        command = "/bin/sleep"
        args    = ["3600"]
      }
      resources {
        memory = 10
        cpu    = 20
      }
    }
  }
}
