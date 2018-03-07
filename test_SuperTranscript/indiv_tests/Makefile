DIRS=S-Lap3_flush\
S-Lap3_fstExt


test:
	@for i in $(DIRS); do \
	echo "Running example in $$i..."; \
	(cd $$i; $(MAKE) test) || exit $$?; done



clean:
	@for i in $(DIRS); do \
	echo "Running example in $$i..."; \
	(cd $$i; $(MAKE) clean) || exit $$?; done
