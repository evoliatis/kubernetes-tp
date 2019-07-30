# Image source
FROM ubuntu:xenial

# Environnement
ENV DEBIAN_FRONTEND noninteractive

# Installation
RUN apt-get update ; apt-get install -y nginx supervisor openssh-server ; mkdir /var/run/sshd

# Mise en place de mes fichiers
COPY ressources /

# Dossier partagé
VOLUME [ "/var/www/html" ]

# Ouverture des ports 80 et 22
EXPOSE 80 22

# Démarrage
ENTRYPOINT [ "supervisord" ]
