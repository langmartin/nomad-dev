job "logmon" {
  datacenters = ["dc1"]

  reschedule {
    attempts = 3
    interval = "10m"
    unlimited = false
  }

  group "g" {
    task "t" {
      driver = "exec"
      config {
	command = "/bin/sleep"
	args    = ["4"]
      }
    }
  }
}
