job "raw_exec.hcl" {
  datacenters = ["dc1"]
  type = "service"
  group "test" {
    count = 2
    ephemeral_disk {
      size = "101"
    }

    spread {
      attribute = "${node.unique.id}"
    }

    task "sleep" {
      driver = "raw_exec"
      config {
        command = "sleep"
        args    = ["3601"]
      }
      resources {
        memory = 10
        cpu    = 20
      }
    }
  }
}
