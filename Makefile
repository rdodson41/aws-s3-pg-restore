bin = bin
bin-all = $(shell find "$(bin)" -type f)

root-bin = /usr/local/bin
root-bin-all = $(patsubst $(bin)/%,$(root-bin)/%,$(bin-all))

.PHONY: help
help:
	@cat share/usage >&2

.PHONY: install
install: $(root-bin-all)

$(root-bin)/%: $(bin)/%
	ln -f -s "$(PWD)/$(<)" "$(@)"

.PHONY: uninstall
uninstall:
	rm -f $(root-bin-all)

.PHONY: reinstall
reinstall: uninstall install

.PHONY: pull
pull:
	git pull --verbose

.PHONY: update
update: uninstall pull install
