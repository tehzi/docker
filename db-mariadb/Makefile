CONTAINER=mariadb

.PHONY: all build run

dump:
	docker run --rm --volumes-from $(CONTAINER) -v $(shell pwd):/backup ubuntu tar cvf /backup/backup.tar /var/lib/mysql