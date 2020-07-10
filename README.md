[![Docker Stars](https://img.shields.io/docker/stars/mpenagar/vanitygen-plusr.svg?style=flat-square)](https://hub.docker.com/r/mpenagar/vanitygen-plus/)
[![Docker Pulls](https://img.shields.io/docker/pulls/mpenagar/vanitygen-plus.svg?style=flat-square)](https://hub.docker.com/r/mpenagar/vanitygen-plus/)


Vanitygen-plus Docker image
====================

Download size of this image is:

[![](https://images.microbadger.com/badges/image/mpenagar/vanitygen-plus.svg)](http://microbadger.com/images/mpenagar/vanitygen-plus "Get your own image badge on microbadger.com")

Usage Example (4xCPU)
-------------------

```bash
$ docker run --rm --network none mpenagar/vanitygen-plus -t 4 -C BTC 1abc
```

Usage Example (4xGPU)
-------------------

```bash
$ docker run --gpus '"device=0,1,2,3"' --rm --network none mpenagar/vanitygen-plus -D 0:0 -D 0:1 -D 0:2 -D 0:3 -C BTC 1abc
```

Command Help
-------------

```bash
$ docker run --rm --network none mpenagar/vanitygen-plus
```

Don't trust
-----------

You can easily build your own docker image and run vanitygen-plus from your build. You can check the Dockerfile, it's simple and clear.

```bash
$ git clone https://github.com/mpenagar/vanitygen-plus
$ cd vanitygen-plus
$ docker build -t vanitygen-plus .
$ docker run --rm --network none vanitygen-plus -t 4 -C BTC 1abc
```

Add some entropy
----------------

You can seed the random number generator from a file `-s <file>`. A simple method is typing some random chars:

```bash
$ docker run -i --rm --network none mpenagar/vanitygen-plus -t 4 -s /dev/stdin -C BTC 1abc << END
> write here
> some random chars
> and end with
> END
```
