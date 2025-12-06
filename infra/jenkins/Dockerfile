# Jenkins Home location (Windows - Docker Desktop):
# cd /mnt/docker-desktop-disk/data/docker/volumes/car-rental-portal-devops_jenkins_home/_data

FROM jenkins/jenkins:lts

USER root
RUN apt-get update && apt-get install -y docker.io git curl && rm -rf /var/lib/apt/lists/*

USER jenkins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt