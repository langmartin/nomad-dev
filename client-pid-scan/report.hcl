job "report.hcl" {
  datacenters = ["dc1"]
  type = "service"
  group "test" {
    count = 10
    ephemeral_disk {
      size = "101"
    }
    task "sleep" {
      driver = "raw_exec"
      config {
        command = "sleep"
        args    = ["3600"]
      }
      resources {
        memory = 10
        cpu    = 20
        network {
          mbits = 10
          port "db" {}
        }
      }
    }
  }
}
