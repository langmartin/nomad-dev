job "exec.hcl" {
  datacenters = ["dc1"]
  type = "service"
  group "test" {
    count = 2
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
