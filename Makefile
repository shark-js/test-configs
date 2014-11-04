test:
	@NODE_ENV=test ./node_modules/.bin/mocha \
		--require chai \
		--harmony \
		$(TESTS) \
		--bail

test-cov:
	@NODE_ENV=test node --harmony \
		node_modules/.bin/istanbul cover \
		./node_modules/.bin/_mocha \
		-- -u exports \
		--require chai \
		$(TESTS) \
		--bail

test-travis:
	@NODE_ENV=test node --harmony \
		node_modules/.bin/istanbul cover \
		./node_modules/.bin/_mocha \
		--report lcovonly \
		-- -u exports \
		--require chai \
		$(TESTS) \
		--bail

lint:
	@NODE_ENV=test ./node_modules/.bin/eslint \
		-c=./node_modules/test-configs/.eslintrc \
		$(SRC)

check-style:
	@NODE_ENV=test ./node_modules/.bin/jscs \
		--config=./node_modules/test-configs/.jscs.json \
		$(SRC)

.PHONY: test bench lint