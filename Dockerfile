FROM nginx:mainline-alpine
LABEL org.opencontainers.image.authors="d3fk"
ENV NGINX_HOST=localhost
ENV NGINX_UPSTREAM_NAME=fpm-app
COPY ./cnf/nginx.conf /etc/nginx/nginx.conf
COPY ./cnf/site.conf /etc/nginx/templates/default.conf.template
WORKDIR /var/www/html/
# Static files might effectively be imported to avoid any data
# persistence afterglow effect that might be due to the use of volumes
# COPY ./static/ /var/www/html/
