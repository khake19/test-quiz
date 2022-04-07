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
