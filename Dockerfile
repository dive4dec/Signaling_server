FROM docker.io/ubuntu:22.04

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
USER root

#install node.js
RUN apt-get update && \
    apt-get install -y curl &&\
    apt-get install -y sudo &&\
    curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - &&\
    apt-get install -y nodejs

#clone yjs
RUN apt-get install git -y && \ 
    git clone https://github.com/yjs/y-webrtc.git

WORKDIR /y-webrtc
#RUN chown -R node:node /y-webrtc

#COPY test.js ./

#install yjs packages
RUN npm i yjs && \ 
    npm i y-webrtc

CMD ["node","./bin/server.js"]
#CMD ["npm", "run", "start" ]

#ENTRYPOINT docker-entrypoint.sh && PORT=4444 node ./bin/server.js



