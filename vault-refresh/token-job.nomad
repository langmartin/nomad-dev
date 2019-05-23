job "token-job.nomad" {
  datacenters = ["dc1"]
  
  group "example" {
    task "server" {
      vault {
	policies = ["nomad-cluster"]
	change_mode   = "signal"
	change_signal = "SIGSTOP"
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
