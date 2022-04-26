# Help Generation --------------------------------------------------------------
.PHONY: help
.DEFAULT_GOAL:=help
help:	## display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-8s\033[0m %s\n", $$1, $$2 } END{print ""}' $(MAKEFILE_LIST)

# Variables --------------------------------------------------------------------

DOCKER_IMAGE:=code_coverage
DOCKER_IMAGE_TEST:=code_coverage_test


# Local Targets ----------------------------------------------------------------

build:	##
	docker build --tag ${DOCKER_IMAGE} .

run: build	##
	docker run --rm -it --publish 8000:8000 ${DOCKER_IMAGE}

build_test:	##
	docker build --tag ${DOCKER_IMAGE_TEST} .

test: build_test	##

	docker run --rm --volume ${PWD}/htmlcov/:/dir/dir/htmlcov:rw $(DOCKER_IMAGE_TEST) \
	/bin/bash -c "cd dir; \
	coverage run -m --omit="*/tests*" unittest; \
	coverage report --fail-under=$$(cat Code-Coverage-Percent.txt); \
	coverage html"



# Local Targets ----------------------------------------------------------------

local_cypress:	##
	# set CYPRESS_BASE_URL=http://localhost:8000/
	npx cypress run

local_server:	##
	python3 -m http.server --directory ./app




