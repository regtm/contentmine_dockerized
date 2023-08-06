FROM node:latest
WORKDIR /install

# update image and install git
RUN apt-get clean -y && apt-get -y update && apt-get -y upgrade &&\
    apt-get -y install apt-utils wget openjdk-17-jdk

# install gepapers from npm repository
RUN npm install --global getpapers

# install norma from the deb package provided in the git
RUN wget --no-check-certificate https://github.com/ContentMine/norma/releases/download/v0.2.26/norma_0.1.SNAPSHOT_all.deb
RUN dpkg -i norma_0.1.SNAPSHOT_all.deb

# install ami
RUN wget --no-check-certificate https://github.com/ContentMine/ami/releases/download/v0.2.24/ami2_0.1.SNAPSHOT_all.deb
RUN dpkg -i ami2_0.1.SNAPSHOT_all.deb

# create non-root user
ARG DOCKER_USER=contentmine
RUN adduser --system --group ${DOCKER_USER}

# create data exchange volume
ARG DATA_PATH=/data
RUN mkdir ${DATA_PATH} && chown -R $DOCKER_USER ${DATA_PATH} && chmod a+rw ${DATA_PATH}
WORKDIR ${DATA_PATH}
VOLUME ${DATA_PATH}

# drop privileges
USER ${DOCKER_USER}