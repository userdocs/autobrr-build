
```bash
docker run -it -u 1000 -v ~/:/home/username ghcr.io/userdocs/autobrr-build:latest build.sh
```

Some very basic options

*Note: using no flags will use the default `goreleaser` method and build multi arch targets in `autobrr/dist`*

`-b` bootstrap by cloning the default repo and do nothing else.

`-d` delete repo and re clone the default repo

`-c` clear the repo and do nothing else.

`-g` specify a github repo (fork) to clone using shorthand `-g userdocs/autobrr`

`-m` build using `make` to quickly get a Linux binary for your arch in `autobrr/bin`
