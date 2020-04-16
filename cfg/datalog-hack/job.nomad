job "job.nomad" {
  datacenters = ["dc1"]

    datalog = <<EOF
job_color(job.nomad, puce).
capabilities(A, time_travel)?
EOF

  group "all" {
    count = 2
    task "any" {
      driver = "raw_exec"
      config {
	command = "/bin/sleep"
	args = ["3000000"]
      }
    }
  }
}
