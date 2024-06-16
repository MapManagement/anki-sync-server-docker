# Anki-Sync-Server-Docker

Since Anki 2.1.57+ the sync server is no more a dedicated service maintained by the
Anki community on GitHub but built into the Anki core services. Both, the Python and the Rust
implementation of the previous sync server, are no longer maintained and therefore don't support
newer versions of the Anki client.  The official  documentation can be found
[here](https://docs.ankiweb.net/sync-server.html).

However, when this repository was created, there wasn't any official Docker image for the new sync
server which encouraged me to publish my own. Anki offers a Python and a Rust implementation but
since Rust compiling for ARM images takes a fews hours, I only support a
[prebuilt Python image](https://github.com/MapManagement/anki-sync-server-docker/pkgs/container/anki-sync-server-docker) 
at the moment. When desired, you can also use the ``Rust.Dockerfile`` which needs to be compiled
manually.

I highly recommend using a reverse proxy to ensure a secure connection. You can start off with
my compose configuration.

## Docker Images

Whenever the [official Anki repository](https://github.com/ankitects/anki) creates a new release,
a GitHub action workflow will be triggered shortly after which builds a new Docker image based on
the published release. All images are stored on the GitHub registry and therefore older releases
are not lost and can still be downloaded.

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
