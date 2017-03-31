# Maintain Files in the Container
# Copy my site files which reside in _site into nginx at build time
# this will serve my static site

FROM nginx

COPY _site /usr/share/nginx/html

VOLUME /usr/share/nginx/html

VOLUME /etc/nginx
