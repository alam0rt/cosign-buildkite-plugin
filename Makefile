all: lint test
 

lint:
	crane run -c compose.yaml lint

test:
	crane run -c compose.yaml tests
