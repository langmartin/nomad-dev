job "j" {
  reschedule {
    attempts = 3
    interval = "10m"
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
