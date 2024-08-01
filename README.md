# `baloobog`

A BalooProxy anti-bot setup to act as a Caddy/Nginx auth server.

## Key component

- balooProxy
- dumhttpd
    > Hand crafted, <1ms response, just response `:3`, multithreadded

## How to run

- Clone
- `make all` to do anything necessary
- `docker-compose up -d`