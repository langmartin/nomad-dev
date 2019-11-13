job "job.hcl" {
  datacenters = ["dc1"]

  group "group" {
    task "tasks" {
      driver = "raw_exec"

      artifact {
	source = "gcs::https://www.googleapis.com/storage/v1/gcs-init-test-0101/sleep"
      }

      config {
	command = "sleep"
	args = ["900"]
      }
    }
  }
}
