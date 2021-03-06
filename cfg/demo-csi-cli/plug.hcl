job "plug" {
  datacenters = ["dc1"]
  type = "system"

  group "csi" {
    task "plugin" {
      driver = "docker"

      config {
	image = "quay.io/k8scsi/hostpathplugin:v1.2.0"

	args = [
	  "--drivername=csi-hostpath",
	  "--v=5",
	  "--endpoint=unix://csi/csi.sock",
	  "--nodeid=foo",
	]

	/* privileged = true */
      }

      csi_plugin {
	id        = "plug"
	type      = "monolith"
	mount_dir = "/csi"
      }

      resources {
	cpu    = 500
	memory = 256

	network {
	  mbits = 10
	  port  "plugin"{}
	}
      }
    }
  }
}
