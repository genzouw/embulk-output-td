FROM openjdk:8-slim

LABEL maintainer "genzouw <genzouw@gmail.com>"

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get -y install \
    --no-install-recommends \
    curl \
  && apt-get clean \
  && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

ENV HOME /root

RUN curl \
  --create-dirs -o $HOME/.embulk/bin/embulk -L "http://dl.embulk.org/embulk-latest.jar" \
  && chmod +x $HOME/.embulk/bin/embulk \
  && $HOME/.embulk/bin/embulk gem install embulk-output-td

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
