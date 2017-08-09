all:

network:
	docker network create \
		-d bridge \
		--subnet 172.30.0.0/16 \
		shared_net