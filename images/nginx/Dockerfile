# Image source
FROM ubuntu:xenial

# Environnement
ENV DEBIAN_FRONTEND noninteractive

# Installation
RUN apt-get update ; apt-get install -y nginx

# Mise en place de mes fichiers
COPY ressources /

# Dossier partagé
VOLUME [ "/var/www/html" ]

# Ouverture du port 80
EXPOSE 80

# Démarrage
ENTRYPOINT [ "nginx" , "-g", "daemon off;" ]
