FROM node:8.11.3-alpine

RUN apk update
RUN apk add git
RUN npm install -g bower grunt-cli

ADD . /

# Setting up client
WORKDIR /client
RUN bower install --allow-root
RUN npm install; exit 0
RUN grunt clean --force
RUN grunt build --force

# Setting up server
WORKDIR /
RUN npm install

EXPOSE 3000
WORKDIR /server

RUN cp -r ../client/app/images ./dist/

ENV NODE_ENV="production"

ENTRYPOINT ["node", "app.js"]
