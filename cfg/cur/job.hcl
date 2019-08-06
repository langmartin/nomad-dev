job "job.hcl" {
  # region = "global"
  datacenters = ["dc1"]
  type = "service"

  group "cache" {
    count = 3

    constraint {
      attribute = "${node.unique.name}"
      operator = "distinct_property"
      value = "2"
    } # constraint

    task "redis1" {
      driver = "raw_exec"
      config {
	command = "/home/centos/redis-5.0.4/src/redis-server"
      }
    }
  }
  task "redis2" {
    driver = "raw_exec"
    config {
      command = "/home/centos/redis-5.0.4/src/redis-server"
    }
  }
}
