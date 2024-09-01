SHELL := bash
.ONESHELL:
.SHELLFLAGS := -euo pipefail -c
MAKEFLAGS += --warn-undefined-variables

setup: configure_hooks
	./install.sh

configure_hooks:
	git config --local core.hooksPath .githooks/

shellcheck:
	@./scripts/shellcheck.sh

docs:
	@./scripts/g.sh
	@bin/g

ci: shellcheck

.PHONY: setup configure_hooks shellcheck docs ci
