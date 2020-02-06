<details><summary>Evicted allocs on lost node stuck in status running #6902 PASS</summary>

For https://github.com/hashicorp/nomad/pull/6902

Repro https://github.com/hashicorp/nomad/issues/6624 using 0.10.3:

1. start a system job
2. start a preempting job in the background
3. kill -9 one node
4. observe job status has a allocation running that desires eviction

```sh
+ /ssh:linux:/home/vagrant/bin/nomad-0103 agent -config=server1.cfg
+ echo 1822
+ /ssh:linux:/home/vagrant/bin/nomad-0103 agent -config=client1.cfg
+ for x in 'server*' 'client*'
+ dir=/tmp/client2
+ mkdir -p /tmp/client2
+ echo 1826
+ sleep 10
+ /ssh:linux:/home/vagrant/bin/nomad-0103 agent -config=client2.cfg
+ /ssh:linux:/home/vagrant/bin/nomad-0103 job run job.hcl
==> Monitoring evaluation "c2de65cd"
    Evaluation triggered by job "job.hcl"
    Evaluation status changed: "pending" -> "complete"
==> Evaluation "c2de65cd" finished with status "complete"
15:56:29 0 linux% ./repro2
+ /ssh:linux:/home/vagrant/bin/nomad-0103 job run high.hcl
+ cat /tmp/client1/pid
+ kill -9 1822
15:57:06 0 linux% ==> Monitoring evaluation "002d646b"
    Evaluation triggered by job "high.hcl"
    Allocation "5b872249" created: node "b1849f61", group "all"
    Allocation "6dc7018d" created: node "a02764f8", group "all"
    Evaluation status changed: "pending" -> "complete"
==> Evaluation "002d646b" finished with status "complete"

15:57:13 0 linux% nomad job status job.hcl
ID            = job.hcl
Name          = job.hcl
Submit Date   = 2020-02-06T15:56:28Z
Type          = system
Priority      = 1
Datacenters   = dc1
Status        = running
Periodic      = false
Parameterized = false

Summary
Task Group  Queued  Starting  Running  Failed  Complete  Lost
all         1       0         1        0       1         0

Placement Failure
Task Group "all":
  * Resources exhausted on 1 nodes
  * Dimension "memory" exhausted on 1 nodes

Allocations
ID        Node ID   Task Group  Version  Desired  Status    Created  Modified
03487511  a02764f8  all         0        evict    complete  48s ago  29s ago
8fb35fe1  b1849f61  all         0        evict    running   48s ago  29s ago
15:57:35 0 linux%
```

With 0.10.4:

```sh
+ /ssh:linux:/home/vagrant/bin/nomad-0104 agent -config=server1.cfg
+ echo 2366
+ for x in 'server*' 'client*'
+ dir=/tmp/client2
+ mkdir -p /tmp/client2
+ /ssh:linux:/home/vagrant/bin/nomad-0104 agent -config=client1.cfg
+ echo 2368
+ sleep 10
+ /ssh:linux:/home/vagrant/bin/nomad-0104 agent -config=client2.cfg
+ /ssh:linux:/home/vagrant/bin/nomad-0104 job run job.hcl
==> Monitoring evaluation "7f2a3106"
    Evaluation triggered by job "job.hcl"
    Evaluation status changed: "pending" -> "complete"
==> Evaluation "7f2a3106" finished with status "complete"
16:00:23 0 linux% ./repro2
+ + /ssh:linux:/home/vagrant/bin/nomad-0104 job runcat high.hcl /tmp/client1/pid

+ kill -9 2366
16:00:45 0 linux% ==> Monitoring evaluation "0e13b3ba"
    Evaluation triggered by job "high.hcl"
    Allocation "a646a44f" created: node "2656400d", group "all"
    Allocation "31ab731f" created: node "602796a6", group "all"
    Evaluation status changed: "pending" -> "complete"
==> Evaluation "0e13b3ba" finished with status "complete"

16:00:54 0 linux% nomad job status job.hcl
ID            = job.hcl
Name          = job.hcl
Submit Date   = 2020-02-06T16:00:22Z
Type          = system
Priority      = 1
Datacenters   = dc1
Status        = running
Periodic      = false
Parameterized = false

Summary
Task Group  Queued  Starting  Running  Failed  Complete  Lost
all         1       0         0        0       1         1

Placement Failure
Task Group "all":
  * Resources exhausted on 1 nodes
  * Dimension "memory" exhausted on 1 nodes

Allocations
ID        Node ID   Task Group  Version  Desired  Status    Created  Modified
503cb7ce  2656400d  all         0        stop     lost      32s ago  10s ago
97f2bb30  602796a6  all         0        evict    complete  40s ago  30s ago
16:01:15 0 linux%
```
</details>
