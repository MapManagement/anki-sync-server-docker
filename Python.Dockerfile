FROM python:3.13-bookworm

ARG ANKI_VERSION="23.12"

EXPOSE 8080

ENV SYNC_USER1="anki:ikna"
ENV SYNC_BASE="/data"
ENV SYNC_HOST="0.0.0.0"
ENV SYNC_PORT="8080"

VOLUME /data

WORKDIR /usr/src/anki-sync-server

RUN mkdir /data && \
    python3 -m venv syncserver && \
    syncserver/bin/pip install anki

ENTRYPOINT ["syncserver/bin/python", "-m", "anki.syncserver"]
