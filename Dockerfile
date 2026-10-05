FROM eclipse-temurin:8-jre-noble

LABEL maintainer "genzouw <genzouw@gmail.com>"

# curl のバージョンはベースイメージ更新で変わるため固定しない
# hadolint ignore=DL3008
RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get -y install \
    --no-install-recommends \
    curl \
  && apt-get clean \
  && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

ENV HOME /root

RUN curl \
  --create-dirs -o $HOME/.embulk/bin/embulk -L "https://github.com/embulk/embulk/releases/download/v0.10.50/embulk-0.10.50.jar" \
  && chmod +x $HOME/.embulk/bin/embulk \
  && curl \
    --create-dirs -o $HOME/.embulk/lib/jruby-complete-9.4.3.0.jar \
    -L "https://repo1.maven.org/maven2/org/jruby/jruby-complete/9.4.3.0/jruby-complete-9.4.3.0.jar" \
  && echo "jruby=file://$HOME/.embulk/lib/jruby-complete-9.4.3.0.jar" > $HOME/.embulk/embulk.properties \
  && $HOME/.embulk/bin/embulk gem install embulk-output-td

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
