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


## ci: Run all CI tests.
.PHONY: ci
ci: test
	@echo "\n==> All quality checks passed"


.PHONY: help
