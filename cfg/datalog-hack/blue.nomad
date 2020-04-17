job "blue" {
  datacenters = ["dc1"]

    datalog = <<EOF
~job_color(A, red)?
EOF

  group "all" {
    count = 3
    task "any" {
      driver = "raw_exec"
      config {
	command = "/bin/sleep"
	args = ["3000000"]
      }
    }
  }
}
