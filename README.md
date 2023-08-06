# Contentmine Dockerized
Dockerfile to build a contentmine container including getpapers, norma and ami.

Find the contentmine project [here](https://github.com/ContentMine).

## Installation

Install from docker hub with:
```
docker pull regtm/contentmine
```

Build locally with:
```docker
docker build -t regtm/contentmine .
```

## Usage
The contentmine script can simply be used this way (dont forget to make it executable `chmod +x ./contentmine`):
```bash
./contentmine $TOOL $PARAMETERS
```

## Manual Usage
Initially the data folder has to be created on the host and made readable for all to avoid permission issues inside the container:
```bash
mkdir -p data
chmod -R a+rw data
```

The container can be used via terminal/comandline. Replace $TOOL with the tool from contentmine that you want to use:
```docker
docker run --rm --volume "${PWD}/data":/data --tty --interactive regtm/contentmine $TOOL
```

