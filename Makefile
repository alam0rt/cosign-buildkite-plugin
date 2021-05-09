all: lint
 
lint:
	crane lift -c compose.yaml
