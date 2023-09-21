# MCDReforged-Docker

[![Release](https://img.shields.io/github/v/release/MCDReforged/MCDReforged-Docker?label=Release)](https://github.com/MCDReforged/MCDReforged-Docker/releases)

> [MCDReforged](https://github.com/Fallen-Breath/MCDReforged) Docker image.

Please note that this is an unofficial image. It is maintained by community members. Please refer to the license for relevant warranties. Version updates may be delayed.

## Version Info

- Python: 3.11
- Java: 19.0.2

## Usage

Docker Hub: [mcdreforged/mcdreforged](https://hub.docker.com/r/mcdreforged/mcdreforged)

The working directory is `/mcdreforged`

I leave a copy of mcdreforged init files in `/mcdreforged_init` if you need to reset the working directory.

### Directly Run

Create and Run Container:

```bash
docker run -i -t --name CONTAINER --volume /path/to/somewhere:/mcdreforged mcdreforged/mcdreforged
```

Docker Compose:

```yaml
version: "3.9"
services:
  mcdreforged:
    image: mcdreforged/mcdreforged:latest
    volumes:
      - /path/to/somewhere:/mcdreforged
    tty: true
    stdin_open: true
```

```bash
docker compose up -d
```

### Tips

- Install Python Packages

```bash
docker exec -it CONTAINER pip install PACKAGE
```

## Image Variants

### `<version>-plus`

This image installed some useful plugins, the plugins list is below.

If you would like to add any plugins, please open an [poll](https://github.com/MCDReforged/MCDReforged-Docker/discussions/new?category=polls).

| Name | Version |
| - | - |
| Quick Backup Multi | 1.9.0 |
| Minecraft Data API | 1.4.1 |
| AdvancedCalculator | 0.3.1 |
| Where Is | 2.0.2 |

### `<version>-slim`

This image is based on the python slim image and does not contain the common Linux packages, only the minimum packages needed to run MCDReforged and Minecraft server.

**Compatibility warning**: You may need to install some packages or take some risk of incompatibility.

The `<version>-slim-plus` image is based on `<version>-slim` and installed the same plugins as `<version>-plus`.
