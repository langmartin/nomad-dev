datacenter = "dev-us-east-1"

advertise {
  http = "127.0.0.1"
  rpc  = "127.0.0.1"
  serf = "127.0.0.1"
}

addresses {
  http = "0.0.0.0"
  rpc  = "0.0.0.0"
  serf = "0.0.0.0"
}

acl {
  enabled = true
}
client {
  options {
    # "docker.auth.config" = "/root/.docker/config.json"
    # "docker.caps.whitelist" = "CHOWN,DAC_OVERRIDE,FSETID,FOWNER,MKNOD,NET_RAW,SETGID,SETUID,SETFCAP,SETPCAP,NET_BIND_SERVICE,SYS_CHROOT,KILL,AUDIT_WRITE,NET_ADMIN"
    "docker.privileged.enabled" = "1"
    "driver.raw_exec.enable" = "1"
  }

  meta {
    "color" = "green"
    "work_load_type" = "generic"
  }
}
leave_on_interrupt = true
telemetry {
  collection_interval = "3s"
  publish_allocation_metrics = true
  publish_node_metrics = true
  prometheus_metrics = true
}
# server {
#     encrypt = "***REDACTED***"
# }
tls {
    http = true
    rpc  = true

  ca_file = "/Users/lang/go/src/github.com/hashicorp/nomad/demo/tls/ca.pem"
  cert_file = "/Users/lang/go/src/github.com/hashicorp/nomad/demo/tls/client.pem"
  key_file = "/Users/lang/go/src/github.com/hashicorp/nomad/demo/tls/client-key.pem"  

    verify_server_hostname = false
    verify_https_client    = false
    # tls_cipher_suites      = "TLS_RSA_WITH_AES_128_GCM_SHA256,TLS_RSA_WITH_AES_256_GCM_SHA384"
}
