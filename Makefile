test:
	@./node_modules/.bin/mocha -u tdd --compilers coffee:coffee-script/register test/**

.PHONY: test
