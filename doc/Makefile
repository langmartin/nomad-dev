all: scheduler.svg csi_volumes.svg delayed-reschedules.svg nomad-network.svg
.PHONY: all

%.svg: %.dot
	dot -Tsvg $^ > $@
