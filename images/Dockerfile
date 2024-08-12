FROM node:22-alpine3.19

ENV NODE_ENV=production

RUN mkdir -p /home/node/app
COPY . /home/node/app

WORKDIR /home/node/app

USER node

CMD npm start
