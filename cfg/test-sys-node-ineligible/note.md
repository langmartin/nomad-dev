<details><summary>System scheduler job update with ineligible nodes #6996 PASS</summary>

For https://github.com/hashicorp/nomad/pull/6996

Repro https://github.com/hashicorp/nomad/issues/5169 using 0.10.3:

1. start the system job
2. mark one node ineligible

```sh
▶ 21:19:24 0 linux% nomad status system.hcl
ID            = system.hcl
Name          = system.hcl
Submit Date   = 2020-02-05T21:18:13Z
Type          = system
Priority      = 50
Datacenters   = dc1
Status        = running
Periodic      = false
Parameterized = false

Summary
Task Group  Queued  Starting  Running  Failed  Complete  Lost
all         0       0         2        0       0         0

Allocations
ID        Node ID   Task Group  Version  Desired  Status   Created  Modified
07a82550  1c0f972c  all         0        run      running  53s ago  53s ago
5d148cc8  a9d4b6ab  all         0        run      running  57s ago  57s ago

▶ 21:20:01 0 linux% nomad node status a9d4b6ab
ID            = a9d4b6ab-f07a-15e1-bd78-21954d5a4960
Name          = client1
Class         = <none>
DC            = dc1
Drain         = false
Eligibility   = ineligible
Status        = ready
Uptime        = 1h36m52s
Host Volumes  = <none>
Driver Status = docker,qemu,raw_exec

Node Events
Time                  Subsystem  Message
2020-02-05T21:18:29Z  Cluster    Node marked as ineligible for scheduling
2020-02-05T21:18:28Z  Cluster    Node registered

Allocated Resources
CPU           Memory         Disk
20/10848 MHz  20 MiB/30 MiB  300 MiB/49 GiB

Allocation Resource Utilization
CPU          Memory
0/10848 MHz  28 MiB/30 MiB

Host Resource Utilization
CPU           Memory           Disk
53/10848 MHz  416 MiB/2.0 GiB  9.3 GiB/61 GiB

Allocations
ID        Node ID   Task Group  Version  Desired  Status   Created    Modified
5d148cc8  a9d4b6ab  all         0        run      running  1m39s ago  1m39s ago
```

Plan update `system.hcl` returns 500:

```sh
▶ 21:22:52 0 linux% nomad job plan system.hcl
Error during plan: Unexpected response code: 500 (could not find node "a9d4b6ab-f07a-15e1-bd78-21954d5a4960")
▶ 21:23:12 255 linux%
```

Setup job then mark one node ineligible using 0.10.4:

```sh
▶ 21:26:17 0 linux% nomad plan system.hcl
+/- Job: "system.hcl"
+/- Task Group: "all" (1 create/destroy update, 1 ignore)
  +/- Task: "low" (forces create/destroy update)
    +/- Config {
      +/- args[0]: "3000000" => "3000001"
          command: "/bin/sleep"
        }

Scheduler dry-run:
- All tasks successfully allocated.

nJob Modify Index: 7
To submit the job with version verification run:

nomad job run -check-index 7 system.hcl

When running the job with the check-index flag, the job will only be run if the
server side version matches the job modify index returned. If the index has
changed, another user has modified the job and the plan's results are
potentially invalid.
▶ 21:27:57 1 linux% nomad job run system.hcl
==> Monitoring evaluation "acbbff19"
    Evaluation triggered by job "system.hcl"
    Allocation "c96fd17e" created: node "6b512755", group "all"
    Evaluation status changed: "pending" -> "complete"
==> Evaluation "acbbff19" finished with status "complete"
▶ 21:29:24 0 linux%
```

Interestingly, given the note
https://github.com/hashicorp/nomad/pull/6996#pullrequestreview-351804577
here, marking the node eligible does re-deploy the blocked evaluation
onto the newly eligible node. The initial condition is right: version
1 is running on the eligible node and version 0 is still running on
the ineligible node (awaiting drain). When we change eligibility, it
does redeploy the system job:

```sh
▶ 21:32:19 0 linux% nomad status system.hcl
ID            = system.hcl
Name          = system.hcl
Submit Date   = 2020-02-05T21:29:23Z
Type          = system
Priority      = 50
Datacenters   = dc1
Status        = running
Periodic      = false
Parameterized = false

Summary
Task Group  Queued  Starting  Running  Failed  Complete  Lost
all         0       0         2        0       1         0

Allocations
ID        Node ID   Task Group  Version  Desired  Status    Created    Modified
c96fd17e  6b512755  all         1        run      running   3m13s ago  3m13s ago
78cc5df3  6b512755  all         0        stop     complete  6m11s ago  3m13s ago
bb73ce4d  0c31efec  all         0        run      running   6m20s ago  6m20s ago
▶ 21:32:36 0 linux% nomad node eligibility -enable 0c31efec
Node "0c31efec-30ba-082e-4fd3-22fb7bbfa967" scheduling eligibility set: eligible for scheduling
▶ 21:33:10 0 linux% nomad status system.hcl
ID            = system.hcl
Name          = system.hcl
Submit Date   = 2020-02-05T21:29:23Z
Type          = system
Priority      = 50
Datacenters   = dc1
Status        = running
Periodic      = false
Parameterized = false

Summary
Task Group  Queued  Starting  Running  Failed  Complete  Lost
all         0       0         2        0       2         0

Allocations
ID        Node ID   Task Group  Version  Desired  Status    Created    Modified
8ae8a13c  0c31efec  all         1        run      running   6s ago     5s ago
c96fd17e  6b512755  all         1        run      running   3m52s ago  3m52s ago
78cc5df3  6b512755  all         0        stop     complete  6m50s ago  3m52s ago
bb73ce4d  0c31efec  all         0        stop     complete  6m59s ago  5s ago
▶ 21:33:16 0 linux%
```
</details>

Extracted from the details: Interestingly, given the note https://github.com/hashicorp/nomad/pull/6996#pullrequestreview-351804577 here, marking the node eligible does re-deploy the blocked evaluation onto the newly eligible node. I think that https://github.com/hashicorp/nomad/pull/5900 fixed https://github.com/hashicorp/nomad/issues/4072, and I just didn't find the issue to close.
