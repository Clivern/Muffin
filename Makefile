help: Makefile
	@echo
	@echo " Choose a command run in Muffin:"
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
	@echo


## test: Run test cases.
.PHONY: test
test:
	@echo ">> ============= Run Tests ============= <<"
	./bin/rake test:all


## setup: Setup dependencies.
.PHONY: setup
setup:
	@echo ">> ============= Setup Dependencies ============= <<"
	./bin/setup


## run: Run Application.
.PHONY: run
run:
	@echo ">> ============== Run Application ============== <<"
	./bin/rails s


## dbconsole: Run Application DB Console.
.PHONY: dbconsole
dbconsole:
	@echo ">> ============== Run Application DB Console ============== <<"
	./bin/rails dbconsole


## console: Run Application Console.
.PHONY: console
console:
	@echo ">> ============== Run Application Console ============== <<"
	./bin/rails console


## about: Get Application Info.
.PHONY: about
about:
	@echo ">> ============== Get Application Info ============== <<"
	./bin/rails about


## stats: Get Code Stats.
.PHONY: stats
stats:
	@echo ">> ============== Get Code Stats ============== <<"
	./bin/rails stats


## version: Get Application Version.
.PHONY: version
version:
	@echo ">> ============== Get Application Version ============== <<"
	./bin/rails version


## ci: Run all CI tests.
.PHONY: ci
ci: test
	@echo "\n==> All quality checks passed"


.PHONY: help
