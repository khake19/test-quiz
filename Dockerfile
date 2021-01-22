FROM theiaide/theia
USER root

# Update and install base packages
RUN apk update && apk upgrade && apk add curl wget bash
# Install ruby and dependencies
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
# Clean APK cache
RUN rm -rf /var/cache/apk/*
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.1/zsh-in-docker.sh)"

USER theia