NAME=00zi/bind
CONTAINER_NAME=bind-old
ZSHRC_PATH=/home/zi/conf/zsh/zshrc
ZSHRC_CUSTOM=/home/zi/conf/zsh/zi.zsh

.PHONY: all build run

all: build

build:
	docker build --rm -t $(NAME) .

run:
	docker run -it --rm $(NAME)

install:
	docker stop $(CONTAINER_NAME)
	docker rm $(CONTAINER_NAME)
	docker run -d -p 53:53/tcp -p 53:53/udp --name=$(CONTAINER_NAME) --restart=always $(NAME)