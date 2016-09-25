NAME=00zi/base
ZSHRC_PATH=/home/zi/conf/zsh/zshrc

.PHONY: all build run

all: build

build:
	cp $(ZSHRC_PATH) .
	docker build --rm -t $(NAME) .

run:
	docker run -it --rm $(NAME)