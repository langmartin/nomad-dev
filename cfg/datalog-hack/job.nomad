job "job.nomad" {
  datacenters = ["dc1"]

  group "all" {
    count = 2

    datalog = <<EOF
job_color(job.nomad, puce).
capabilities(A, time_travel)?
EOF

    task "any" {
      driver = "raw_exec"
      config {
	command = "/bin/sleep"
	args = ["3000000"]
      }
    }
  }
}
