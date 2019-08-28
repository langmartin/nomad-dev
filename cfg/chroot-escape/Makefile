artifact.tgz: exploit
	tar czf $@ $^

exploit: exploit.c
	gcc -static -o $@ $^
	chmod 4755 $@
