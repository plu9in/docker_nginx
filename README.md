# docker_nginx
Docker with nginx to maintain several web apps or sites on the same server

## Description 

The scenario is as followed:
* one server
* several sites / web apps on it running in docker containers
* two networks:
  * a frontend network with only a nginx proxy server
  * a backend network reachable only through nginx

We want to be able to:
* start/stop each web app / site independently
* with no downtime

As we don't have several servers, swarm is not really useful.

This is a really basic scenario but it gets straight to the point.

## prerequisites

docker should be installed.
to test it, curl should be installed.

## [create_networks.sh](create_networks.sh)

This script creates two networks (front and back) and has to be run before testing.

## [disable_site.sh](disable_site.sh)

It removes a link from /etc/nginx/sites-enabled and reloads the configuration.

## [enable_sites.sh](enable_sites.sh)

It enables all configurations that resides in ./sites-available

## [test_nginx.sh](test_nginx.sh)

It requests the landing page of whateveryouwant.com. 
When the site is enabled, you have an answer. The echo_server answers.
When the site is not enabled, you have an error. You can configurate the default answer if needed.
