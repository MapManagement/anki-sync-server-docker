FROM rust:1.73 as builder

ARG ANKI_VERSION="23.12"
WORKDIR /usr/src/anki-sync-server

RUN apt update -y && \
    apt install -y protobuf-compiler && \
    cargo install --git https://github.com/ankitects/anki.git --tag ${ANKI_VERSION} anki-sync-server


FROM debian:bookworm-slim

EXPOSE 8080
ENV SYNC_USER1="anki:ikna"
ENV SYNC_BASE="/data"
ENV SYNC_HOST="0.0.0.0"
ENV SYNC_PORT="8080"

VOLUME /data

RUN apt-get update -y && \
    mkdir /data
COPY --from=builder /usr/local/cargo/bin/anki-sync-server /usr/local/bin/anki-sync-server

ENTRYPOINT ["anki-sync-server"]
