# MCDReforged-Docker

[![Release](https://img.shields.io/github/v/release/MCDReforged/MCDReforged-Docker?label=Release)](https://github.com/MCDReforged/MCDReforged-Docker/releases)

> MCDReforged Docker image.

## Version Info

- Python: 3.11
- Java: 19
- MCDReforged: 2.7.2

## Usage

Docker Hub: [zhanganzhi/mcdreforged](https://hub.docker.com/r/zhanganzhi/mcdreforged).

The working directory is `/mcdreforged`.

I leave a copy of mcdreforged init files in `/mcdreforged_init` for you to copy.

### Create and Copy Files

There are some mcdreforged files in the image, so if you want use volume on your host, you should copy them from the container to avoid overwriting by the empty directory on your host.

```bash
docker create --name CONTAINER --volume /path/to:/mcdreforged zhanganzhi/mcdreforged
docker cp CONTAINER:/mcdreforged_init/ /path/to
```

### Start Container

```bash
docker start CONTAINER
```

### Docker Compose

```yaml
