NAME=00zi/php7.0

.PHONY: all build run php-src

all: build

build:
	docker build --rm -t $(NAME) .

# shell:
# 	docker run -it $(NAME) zsh

run:
	docker run --name php7.0 -it --rm $(NAME)

