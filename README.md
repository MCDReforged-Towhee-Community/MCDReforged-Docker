# MCDReforged-Docker

[![Release](https://img.shields.io/github/v/release/MCDReforged/MCDReforged-Docker?label=Release)](https://github.com/MCDReforged/MCDReforged-Docker/releases)

> MCDReforged Docker image.

## Version Info

- Python: 3.11
- Java: 19

## Usage

Docker Hub: [mcdreforged/mcdreforged](https://hub.docker.com/r/mcdreforged/mcdreforged).

The working directory is `/mcdreforged`.

I leave a copy of mcdreforged init files in `/mcdreforged_init` for you to copy.

### Directly Run

#### Create and Copy Files

There are some mcdreforged files in the image, so if you want use volume on your host, you should copy them from the container to avoid overwriting by the empty directory on your host.

```bash
docker create -i -t --name CONTAINER --volume /path/to/somewhere:/mcdreforged mcdreforged/mcdreforged
sudo docker cp CONTAINER:/mcdreforged_init/. /path/to/somewhere
```

#### Start Container

```bash
docker start CONTAINER
```

### Docker Compose

```yaml
version: "3.9"
services:
  mcdreforged:
    image: mcdreforged/mcdreforged:latest
    volumes:
      - ./mcdreforged:/mcdreforged
    tty: true
    stdin_open: true
```

```bash
docker compose create
sudo docker cp CONTAINER:/mcdreforged_init/. /path/to/somewhere
```

### Tips

#### Install Python Packages

```bash
docker exec -it CONTAINER pip install PACKAGE
```
