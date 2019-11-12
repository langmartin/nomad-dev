all: scheduler.svg csi_volumes.svg
.PHONY: all

%.svg: %.dot
	dot -Tsvg $^ > $@
