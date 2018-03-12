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
    apt-get install -y vim xvfb x11vnc xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic && \
    npm i -g npm@${NPM_VERSION}

# Installing Chrome
RUN apt-get install gconf-service libgconf-2-4 libnspr4 libnss3 libpango1.0-0 libappindicator1 libcurl3
RUN curl https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o chrome.deb && dpkg --install chrome.deb && rm chrome.deb
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
