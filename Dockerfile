# syntax = docker/dockerfile:1

ARG RUBY_VERSION=3.2.2
FROM ruby:$RUBY_VERSION-slim as base

WORKDIR /rails

ARG POSTGRES_USER
ARG POSTGRES_PASSWORD
ARG POSTGRES_DB
ARG POSTGRES_HOST
ARG POSTGRES_PORT
ARG RAILS_ENV
ENV POSTGRES_USER=${POSTGRES_USER}
ENV POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
ENV POSTGRES_DB=${POSTGRES_DB}
ENV POSTGRES_HOST=${POSTGRES_HOST}
ENV POSTGRES_PORT=${POSTGRES_PORT}
ENV RAILS_ENV=${RAILS_ENV}
ENV BUNDLE_PATH="/usr/local/bundle"

FROM base as build

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    build-essential git libpq-dev libvips pkg-config nodejs npm && \
    npm install -g yarn && \
    rm -rf /var/lib/apt/lists/*

COPY Gemfile Gemfile.lock ./

RUN BUNDLE_WITHOUT="" bundle install && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git

COPY . .

RUN yarn install --check-files && \
    yarn add flowbite && \
    yarn cache clean

RUN SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile

FROM base

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y curl libvips postgresql-client && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /rails /rails

COPY bin/docker-entrypoint /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

RUN useradd rails --create-home --shell /bin/bash && \
    chown -R rails:rails db log storage tmp
USER rails:rails

ENTRYPOINT ["sh", "/usr/bin/entrypoint.sh"]

EXPOSE 3000

CMD ["./bin/rails", "server", "-b", "0.0.0.0", "-p", "3000"]
