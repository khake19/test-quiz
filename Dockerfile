# run bundle install for backend dependencies
FROM ruby:2.5.1

WORKDIR /backend

RUN mkdir -p /backend/vendor/bundle /backend/vendor/bundle && \
  gem install bundler:2.2.5

COPY /backend/Gemfile /backend/Gemfile.lock /backend/.ruby-version ./
COPY /backend/vendor/bundle /backend/vendor/bundle/
ARG bundle_gemfile=/backend/Gemfile
ENV BUNDLE_GEMFILE=${bundle_gemfile} BUNDLE_PATH=/backend/vendor/bundle RAILS_SERVE_STATIC_FILES=true RAILS_LOG_TO_STDOUT=true
ENV BUNDLER_VERSION 2.2.5
RUN bundle install

# run yarn install for client dependencies
FROM node:14-alpine AS deps
# Check https://github.com/nodejs/docker-node/tree/b4117f9333da4138b03a546ec926ef50a31506c3#nodealpine to understand why libc6-compat might be needed.
RUN apk add --no-cache libc6-compat

WORKDIR /client
COPY /client/package.json /client/yarn.lock ./client/
RUN yarn install --frozen-lockfile

# community-managed image of codercom/code-server
FROM linuxserver/code-server
USER root

# Basic Package
RUN apt-get update && apt-get -y upgrade && apt-get install -y curl wget bash
RUN apt-get install -y \
  build-essential \
  nodejs \
  ruby \
  ruby-dev \
  ruby-bundler \
  ruby-bigdecimal \
  ruby-irb \
  libxml2-dev \
  libxslt-dev \
  libssl1.1 \
  libc6-dev \
  sqlite3 \
  libsqlite3-dev \
  socat

# to install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && sudo apt-get install -y yarn

# clean apk caches
RUN rm -rf /var/lib/apt/lists/*
