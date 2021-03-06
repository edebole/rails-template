FROM ruby:3.0-alpine

RUN apk add --update --no-cache \
    build-base \
    busybox \
    postgresql-dev \
    yaml-dev \
    zlib-dev \
    nodejs \
    yarn \
    tzdata

ENV BUNDLER_VERSION=2.1.4

WORKDIR /app

COPY Gemfile* ./

RUN gem install bundler:$BUNDLER_VERSION \
    && bundle install && \
    yarn install && \
    rails assets:precompile

COPY . .

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]

