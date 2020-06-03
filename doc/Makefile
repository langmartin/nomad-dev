all: scheduler.svg csi_volumes.svg delayed-reschedules.svg
.PHONY: all

%.svg: %.dot
	dot -Tsvg $^ > $@
