# MCDReforged-Docker

[![Release](https://img.shields.io/github/v/release/MCDReforged-Towhee-Community/MCDReforged-Docker?label=Release)](https://github.com/MCDReforged-Towhee-Community/MCDReforged-Docker/releases)

> [MCDReforged](https://github.com/Fallen-Breath/MCDReforged) Docker image.

Please note that this is an unofficial image. It is maintained by community members. Please refer to the license for relevant warranties. Version updates may be delayed.

## Version Info

- Python: 3.12
- Java: 21.0.2

## Usage

Docker Hub: [mcdrtowhee/mcdreforged](https://hub.docker.com/r/mcdrtowhee/mcdreforged)

The working directory is `/mcdreforged`

I leave a copy of mcdreforged init files in `/mcdreforged_init` if you need to reset the working directory.

### Directly Run

Create and Run Container:

```bash
docker run -i -t --name CONTAINER --volume /path/to/somewhere:/mcdreforged mcdrtowhee/mcdreforged
```

Docker Compose:

```yaml
version: "3.9"
services:
  mcdreforged:
    image: mcdrtowhee/mcdreforged:latest
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

If you would like to add any plugins, please open an [poll](https://github.com/MCDReforged-Towhee-Community/MCDReforged-Docker/discussions/new?category=polls).

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

## License

Copyright © 2023 All Contributors.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
