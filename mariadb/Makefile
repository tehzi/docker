NAME=00zi/mariadb
ZSHRC_PATH=/home/zi/conf/zsh/zshrc
ZSHRC_CUSTOM=/home/zi/conf/zsh/zi.zsh

.PHONY: all build run

all: build

build:
	cp $(ZSHRC_PATH) .
	cp $(ZSHRC_CUSTOM) .
	sed -i '/ssh_hosts=/d' zi.zsh
	docker build --rm -t $(NAME) .

run:
	docker run -it --rm $(NAME)