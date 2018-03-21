Docker NodeJS 9 + Python + Git
=======================================

This repository holds the items used to run NodeJS applications, it includes python and the latest version of git, it also allows you to store your password so you don't have to authenticate all the time.   

See this image on [Docker Hub](https://hub.docker.com/r/arthurgeron/docker-nodejs/)   

## Content

- NodeJS 9.x   
- Python 2.7   
- Chrome Stable   
- Standard and Eslint npm packages   
## Usage    

This container has the necessary tools to let you run npm commands against the master.  
        ## Just run it   
        `docker run -it -v arthurgeron/docker-nodejs`   
        ## Run it sharing files outside the docker container   
        `docker run -it -v /your/dir/to/be/shared:/src arthurgeron/docker-nodejs /bin/bash`