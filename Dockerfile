FROM rust:1.67 AS builder
WORKDIR /usr/src/dumhttpd
COPY . .
RUN cargo install --path .

FROM debian:bullseye-slim
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*
COPY --from=builder /usr/local/cargo/bin/dumhttpd /usr/local/bin/dumhttpd
CMD ["dumhttpd"]