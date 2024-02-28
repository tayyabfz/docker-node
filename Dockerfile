FROM ubuntu

RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get upgrade -y
RUN apt-get install -y nodejs
RUN npm install -g yarn
RUN yarn -v

WORKDIR /usr/app

COPY package.json package.json
COPY yarn.lock yarn.lock
# COPY main.js main.js

COPY . .


RUN yarn install

ENTRYPOINT [ "node", "main.js" ]