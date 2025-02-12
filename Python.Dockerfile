FROM python:3.13-bookworm

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

RUN useradd --create-home syncer
USER syncer

ENTRYPOINT ["syncserver/bin/python", "-m", "anki.syncserver"]
