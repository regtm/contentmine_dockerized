# Contentmine Dockerized
Dockerfile to build a contentmine container including getpapers, norma and ami.

Find the contentmine project [here](https://github.com/ContentMine).

Build via:
```docker
docker build -t contentmine .
```

The container can be used via cli. Replace $TOOL with the tool from contentmine that you want to use:
```docker
docker run --rm --volume "${PWD}/data":/data --tty --interactive contentmine $TOOL
```