.PHONY: build test format

build:
	protostar build

install:
	protostar install
	protostar update

test:
	protostar test tests/
