PREFIX ?= $(HOME)/.local
BINDIR ?= $(PREFIX)/bin

.PHONY: install uninstall

install:
	@mkdir -p $(BINDIR)
	@cp bin/wt $(BINDIR)/wt
	@chmod +x $(BINDIR)/wt
	@echo "Installed wt to $(BINDIR)/wt"
	@echo ""
	@echo "Make sure $(BINDIR) is in your PATH:"
	@echo '  export PATH="$$HOME/.local/bin:$$PATH"'

uninstall:
	@rm -f $(BINDIR)/wt
	@echo "Uninstalled wt from $(BINDIR)/wt"
