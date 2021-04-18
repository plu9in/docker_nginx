#!/usr/bin/env bash
for i in `ls ./nginx_proxy/sites-available/*.conf`; do
	docker exec -it rproxy ln -s /etc/nginx/sites-available/`basename $i` /etc/nginx/sites-enabled/`basename $i`
done;
docker exec -it rproxy nginx -s reload
