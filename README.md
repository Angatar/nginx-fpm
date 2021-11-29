![Docker Pulls](https://img.shields.io/docker/pulls/d3fk/nginx-fpm) ![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/d3fk/nginx-fpm) ![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/d3fk/nginx-fpm) ![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/d3fk/nginx-fpm) ![Docker Stars](https://img.shields.io/docker/stars/d3fk/nginx-fpm) [![GitHub license](https://img.shields.io/github/license/Angatar/nginx-fpm)](https://github.com/Angatar/nginx-fpm/blob/master/LICENSE)
# nginx-fpm (Angatar> d3fk/nginx-fpm)

Simply nginx:alpine configured to serve fpm applications.
2 versions
- 1 for FastCGI upstream applications in general (e.g. PHP-FPM)
- 1 for FastCGI applications (e.g. PHP-FPM) that uses SSE technique "Server Sent Event"/"event-stream", or any other FastCGI app that requires the nginx cache and buffering options to be disabled.

## Docker image
pre-build from Docker hub with "automated build" option.

image name **d3fk/nginx-fpm**

`docker pull d3fk/nginx-fpm`

Docker hub repository: https://hub.docker.com/r/d3fk/nginx-fpm/


## Available tags
- **d3fk/nginx-fpm:latest** this is the image with the basic configuration for fpm applications in general (upstream on port 9000, resolved with "fpm-app" as default name... see ENVIRONMENT section)
- **d3fk/nginx-fpm:master** this image is simply another tag for **d3fk/nginx-fpm:latest**, they are identical images
- **d3fk/nginx-fpm:sse** is the image version for any upstream FastCGI application that requires that the nginx cache and buffering options are disabled in the configuration (e.g. PHP-FPM applications that uses SSE technique "Server Sent Event"/"event-stream" ).

## Basic usage

```sh
docker run -p 80:80 d3fk/nginx-fpm
```
This nginx container is configured to serve any upstream FastCGI content provided by an application(available on port 9000) on the same sub-network or linked (--link option); the upstream FastCGI application name should be resolved by using "fpm-app" for name by default (the name "fpm-app" of the FastCGI upstream app can be adapted with ENV vars) ... see ENVIRONMENT section.

## ENVIRONMENT
-```NGINX_HOST```: the server hostname, its default value is set to "localhost" but you can override it with your domain name on run.
-```NGINX_UPSTREAM_NAME```: the FastCGI upstream name that can be reached on port 9000. It can be the name of an fpm container on the same subnetwork (docker using its own DNS to resolve the name) or using the --link option (docker maintains /etc/hosts up to date on containers using the --link option) or even any "url or ip" of an fpm app that can be reached on port 9000 (it is recommended to not expose your fpm port to the world). The default value is set to "fpm-app" so that this container will by default try to reach any fpm app that resolves with the name "fpm-app" on port 9000.

## More advanced usage and examples
```sh
docker run -p 8080:80 --env NGINX_HOST=my-domain-name.io --env NGINX_UPSTREAM_NAME=php-fpm d3fk/nginx-fpm
```

You can have an example of use of this container by visiting the page of a d3fk container image that proposes a "fpm" tag version, e.g.: [d3fk/asciinematic](https://hub.docker.com/r/d3fk/asciinematic/)


## To be continued ...

Handling of SSL certificates could easily be implemented.

[![GitHub license](https://img.shields.io/github/license/Angatar/nginx-fpm)](https://github.com/Angatar/nginx-fpm/blob/master/LICENSE)
