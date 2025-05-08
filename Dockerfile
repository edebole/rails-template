ARG RUBY_VERSION
FROM ruby:${RUBY_VERSION}-bullseye

ENV DEBIAN_FRONTEND=noninteractive 

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
  autoconf \
  bison \
  patch \
  build-essential \
  rustc \
  libssl-dev \
  libyaml-dev \
  libreadline-dev \
  zlib1g-dev \
  libgmp-dev \
  libncurses5-dev \
  libffi-dev \
  libgdbm6 \
  libgdbm-dev \
  libdb-dev \
  libvips \
  libvips-tools \
  uuid-dev \
  git \
  curl \
  vim \
  default-libmysqlclient-dev \
  pkg-config \
  procps \
  unzip \
  imagemagick \
  libmagickwand-dev \
  libmagic-dev \
  libcurl4-openssl-dev \
  libjemalloc2 \
  tzdata \
  && apt-get clean && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

WORKDIR /app

COPY . .

EXPOSE 3000

CMD rm -f tmp/pids/server.pid && bundle exec rails s -b 0.0.0.0
