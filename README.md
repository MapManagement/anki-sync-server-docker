# Anki-Sync-Server-Docker

Since Anki 2.1.57+ the syn server is no more a dedicated service maintained by the
Anki community on GitHub but built into the Anki core services. Both, the Python and the Rust
implementation of the previous sync server, are no longer maintained and therefore don't support
newer versions of the Anki client.

However, when this repository was created, there wasn't any official Docker image for the new sync
server which encouraged me to publish my own. It is based on the Rust sync server. The official 
documentation can be found [here](https://docs.ankiweb.net/sync-server.html).

I highly recommend using a reverse proxy to ensure a secure connection. You can start off with
my compose configuration.

## Environment Variables

|  Variable  |  Default  |          Purpose         |
|:----------:|:---------:|:------------------------:|
| SYNC_USER1 | anki:ikna |   Default Anki account   |
| SYNC_USERX |     -     | Additional Anki accounts |
|  SYNC_BASE |   /data   |  Data storage directory  |
|  SYNC_HOST |  0.0.0.0  |       Host binding       |
|  SYNC_PORT |    8080   |       Port binding       |

## Volumes

The only volume to take care of is the ``/data`` directory which stores all your packages. If you
wish to, you can also change the directory by changing ``SYNC_BASE`` in your environment variables.
Don't forget to adjust your volume accordingly.
