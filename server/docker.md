# Docker

This file contains useful commands and information about running Docker on a server.

## Attach to a Container

If running a container using `docker run`, the terminal will automatically attach unless the `-d` option is specified.
Attempting to detach from such a container will signal `docker` to kill the container. To avoid this, the command must
user the `--sig-proxy=false` option. With this option, pressing `ctrl+c` will detach from the container.

To attach to a running container, use the `docker attach` command. As above, this will attach the terminal permanently
and attempting to detach will kill the container. Use the `--sig-proxy=false` option to avoid this.

## Binary Distributions

Docker binary distributions are (for some reason) unreliable. It's possible that you'll need to use the binaries for an
older version of your OS, or for the major version of your OS (as opposed to the minor version). The raw distributions
are located [here](https://download.docker.com/linux/).

## Coping Directories to Container

To copy an entire directory recursively using Dockerfile commands, use the `COPY` directive as follows:

```
COPY src/ dest/
```

This will copy `src` recursively into the `dest` folder of the container. If you do `COPY src/* dest/`, it will instead
copy the contents of `src` **non-recursively** into `dest`.

## Logs

If logging is enabled for Docker, the logs are stored in `/var/lib/docker/containers/<container_id>/`.

## Start Containers Automatically on Startup

Docker containers should not be manually managed using `systemd`. The Docker daemon (`dockerd`) is managed by
`systemd` and is setup during Docker installation. Setting the "restart policy" for a container will allow the daemon
to manage it. The documentation for Docker restart policies is located
[here](https://docs.docker.com/config/containers/start-containers-automatically/).
