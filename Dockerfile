FROM elixir:1.14-otp-25-alpine AS build

# Env
ENV MIX_ENV=prod


# Install dependencies
RUN apk update
RUN apk --no-cache --update add \
      make \
      g++ \
      wget \
      curl \
      inotify-tools
# Prepare App
COPY ./ /app
WORKDIR /app

RUN mix do local.hex --force, local.rebar --force
RUN mix deps.get
RUN mix assets.deploy
RUN mix do compile, release

# Prepare release image
FROM alpine:3.17 AS app

ENV MIX_ENV=prod
ENV PHX_SERVER=true

ARG MIX_ENV=prod
RUN apk add --no-cache libstdc++ openssl ncurses-libs

WORKDIR /app

COPY --from=build --chown=nobody:nobody /app/_build/${MIX_ENV}/rel/deep_thought /app
RUN chown nobody:nobody /app

USER nobody:nobody
ENV HOME=/app
EXPOSE 4000

CMD ["bin/deep_thought", "start"]
