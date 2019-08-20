NAME=00zi/php5.3

.PHONY: all build run php-src

all: build

build:
	docker build --rm -t $(NAME) .
#	docker images -f dangling=true -q | xargs docker rmi