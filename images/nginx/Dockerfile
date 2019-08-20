# Source
FROM ubuntu:bionic

# Install
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update ; apt-get install -y nginx ; \
    rm /var/www/html/index.nginx-debian.html

# Injection
ADD ressources /

# Partage
VOLUME [ "/var/www/html" ]
EXPOSE 80

# Démarrage
ENTRYPOINT [ "nginx" ]
CMD [ "-g" , "daemon off;" ]
