NAME=00zi/php7.1

.PHONY: all build run php-src

all: build

build:
	docker build --rm -t $(NAME) .

run:
	docker run --name php7.1 -it --rm $(NAME)

