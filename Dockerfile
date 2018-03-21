FROM node:9
ENV NPM_VERSION 5.7.1
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
RUN apt-get install -y gconf-service libgconf-2-4 libnspr4 libnss3 libpango1.0-0 libappindicator1 libcurl3 xdg-utils
RUN curl https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o chrome.deb && dpkg --install chrome.deb && rm chrome.deb; apt-get install -f -y
RUN npm i -g standard eslint
EXPOSE 8888
EXPOSE 3000
EXPOSE 4000

RUN mkdir -p /src
WORKDIR /src
ENTRYPOINT ["/bin/bash", "--login", "-i", "-c"]
