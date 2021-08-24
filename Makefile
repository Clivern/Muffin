RUBY        ?= ruby
RDOC        ?= rdoc
BUNDLE      ?= bundle
RAKE        ?= rake
GEM         ?= gem


help: Makefile
	@echo
	@echo " Choose a command run in Muffin:"
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
	@echo


## docs: Generate Docs
.PHONY: doc
doc:
	@echo ">> ============= Generate Docs ============= <<"
	$(RDOC)


## test: Run test cases
.PHONY: test
test:
	@echo ">> ============= Run Tests ============= <<"
	$(RAKE) spec


## console: Run interactive console.
.PHONY: console
console:
	@echo ">> ============= Run Console ============= <<"
	./bin/console


## setup: Setup dependencies.
.PHONY: setup
setup:
	@echo ">> ============= Setup Dependencies ============= <<"
	./bin/setup


## build: Build the ruby gem.
.PHONY: build
build:
	@echo ">> ============= Build the Package ============= <<"
	$(GEM) build scone.gemspec


## push: Publish the ruby gem.
.PHONY: push
push:
	@echo ">> ============= Publish the Package ============= <<"
	$(GEM) push scone-*.gem


## install: Install the gem locally.
.PHONY: install
install:
	@echo ">> ============= Install Locally ============= <<"
	$(RAKE) install


## release: Release the gem.
.PHONY: release
release:
	@echo ">> =========== Release the Package =========== <<"
	$(RAKE) release


## ci: Run all CI tests.
.PHONY: ci
ci: test
	@echo "\n==> All quality checks passed"


.PHONY: help
