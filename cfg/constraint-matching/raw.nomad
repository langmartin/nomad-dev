job "raw.nomad" {
  datacenters = ["dc1"]
  type = "service"		# bug is only for system

  group "all" {

    # update {
    #   max_parallel = 3
    #   auto_promote = true
    #   canary = 1
    # }
    
      count = 2

    task "low" {

      driver = "raw_exec"

      config {
	command = "/bin/sleep"
	args = ["3000000"]
      }

      # some but not all clients match the constraint
      # constraint {
      # 	attribute = "${meta.tag}"
      # 	value = "foo"
      # }

      # claim more resources than a client has available to trigger an error
      resources {
        cpu    = 20
        memory = 20
      }
    }
  }
}
