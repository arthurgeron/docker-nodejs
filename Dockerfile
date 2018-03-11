FROM node:9
ENV NPM_VERSION 5.7.1
ENV login $1
ENV password $2
ENV DISTRO "$(lsb_release -s -c)"
# Install dependencies for build tools
RUN apt-get update && \
    apt-get install -y software-properties-common apt-utils build-essential && \
    apt-get update && \
    apt-get install -y curl git-all make wget && \
    apt-get install -y python python-pip && \
    apt-get install -y xvfb x11vnc xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic && \
    npm i -g npm@${NPM_VERSION}
RUN echo '[user]\
        email = ${login}\
        [credential]\
        [push]\
        default = current\
        [core]\
        preloadindex = true\
        fscache = true\
        [gc]\
        auto = 256\
        [credential]' >> ~/.gitconfig
RUN echo 'machine github.com\
         login ${login}\
         password ${password}' >> ~/.netrc
EXPOSE 8888

RUN mkdir -p /src/node_modules
WORKDIR /src
ENTRYPOINT ["/bin/bash", "--login", "-i", "-c"]
