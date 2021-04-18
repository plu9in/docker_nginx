rm ./nginx_proxy/sites-enabled/$1
docker exec -it rproxy nginx -s reload
