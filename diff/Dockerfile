FROM node:11-alpine

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY . .

RUN apk add --no-cache git
RUN npm install
RUN npm install -g diff2html-cli