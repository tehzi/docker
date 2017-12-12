NAME=00zi/php5.3

.PHONY: all build run php-src

all: build

build:
	docker build --rm -t $(NAME) .

# shell:
# 	docker run -it $(NAME) zsh

run:
	docker run --name php5.3 -it --rm $(NAME)

