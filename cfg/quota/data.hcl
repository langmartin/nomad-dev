name = "one"
description = "Limit the shared default namespace"

limit {
    region = "global"
    region_limit {
        cpu = 2500
        memory = 1000
        network {
          mbits = 50
        }
    }
}
