# dotfiles

## Dependencies

These dependencies are needed to be installed on host machine:

- colima
  - docker

## How to use

Build image from Dockerfile:

```shell
docker build -t m02uku-dev
```

Run container from built image:

```shell
docker run --rm -it m02uku-dev
```

- Rebuild image to reload configs under `dotconf` directory
