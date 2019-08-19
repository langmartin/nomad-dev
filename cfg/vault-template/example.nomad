job "example.nomad" {
  datacenters = ["dc1"]

  group "cache" {
    task "redis" {
      driver = "docker"

      config {
	image = "redis:3.2"
      }

      resources {
	cpu    = 500
	memory = 256
      }

      vault {
	policies = ["default", "product_nomad_mgr", "product_nomad_operator_policy"]
      }

      # bind_port:   {{ secret "hello/world" }}
      template {
	data = <<EOH
  ---
    scratch_dir: {{ secret "auth/approle/role/product_nomad_mgr/role-id" }}
  EOH

	destination = "local/file.yml"
      }

    }
  }
}
