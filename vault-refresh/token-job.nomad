job "token-job.nomad" {
  datacenters = ["dc1"]
  
  group "example" {
    task "server" {
      vault {
	policies = ["nomad-server"]
	change_mode   = "signal"
	change_signal = "SIGUSR1"
      }

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
