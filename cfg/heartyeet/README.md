`start`:
  - sets up the cluster
  - runs the `yeet.hcl` job
  - firewalls the client
  - waits for `stop_after_client_disconnect` to stop the task
  - runs `stop -purge` on the job and re-runs it (necessary for the 0.11.2 repro)

If you want to interact with the yeet job (to examine evals or
allocs), comment out the purge/run at the bottom.

`repro` and `depro`: install/remove the iptables rule

`stop`: cleanup
