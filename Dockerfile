FROM theiaide/theia
USER root

# Basic Package
RUN apk update && apk upgrade && apk add curl wget bash
RUN apk add \
  ruby \
	ruby-dev \
  ruby-bundler \
  ruby-bigdecimal \
  ruby-irb \
  build-base \
  libxml2-dev \
  libxslt-dev \
  libssl1.1 \
  libc6-compat \
  sqlite \
  sqlite-dev \
  socat

# clean apk caches
RUN rm -rf /var/cache/apk/*