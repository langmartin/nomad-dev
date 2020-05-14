job "job.hcl" {
  # region = "global"
  datacenters = ["dc1"]
  type = "service"

  constraint {
    attribute = "${node.unique.name}"
    operator = "distinct_property"
    value = "2"
  }

  update {
    max_parallel = 2
    # progress_deadline = "0s"
  }

  group "foo" {
    task "bar" {
      driver = "raw_exec"
      config {
	command = "sleep"
	args = ["3600"]
      }
    }
  }


  group "cache" {
    count = 4

    task "redis1" {
      driver = "raw_exec"
      config {
	command = "sleep"
	args = ["3601"]
      }
    }

    task "redis2" {
      driver = "raw_exec"
      config {
	command = "sleep"
	args = ["3601"]
      }
    }
  }
}
