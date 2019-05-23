job "token-job.nomad" {
  datacenters = ["dc1"]
  
  group "example" {
    task "server" {
      vault {
	policies = ["nomad-cluster"]
	change_mode   = "restart"
	env = true
      }

      driver = "raw_exec"

      config {
	command = "/bin/sh"
	args = ["-c", "echo $VAULT_TOKEN >> /tmp/tokens.log; sleep 314159"]
      }

      resources {
	cpu    = 20
	memory = 20
      }
    }
  }
}
