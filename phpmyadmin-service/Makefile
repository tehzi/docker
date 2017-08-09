NAME=00zi/phpmyadmin

.PHONY: all build run

all: build

build:
	docker build --rm -t $(NAME) .

run:
	docker run -it --rm $(NAME)