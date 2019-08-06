job "job.hcl" {
  # region = "global"
  datacenters = ["dc1"]
  type = "service"

  constraint {
    attribute = "${node.unique.name}"
    operator = "distinct_property"
    value = "2"
  }

  # update {
  #   max_parallel = 6
  # }

  group "cache" {
    count = 6

    task "redis1" {
      driver = "raw_exec"
      config {
	command = "sleep"
	args = ["3600"]
      }
    }

    task "redis2" {
      driver = "raw_exec"
      config {
	command = "sleep"
	args = ["3600"]
      }
    }
  }
}
