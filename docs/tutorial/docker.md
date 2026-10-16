# docker

`docker` is built the same way as [basics](basics.md): a title, a description, and a lesson. The difference is what the lesson does. It starts a container.

## config.yaml

```yaml
title: Intro to Docker
description: Learn Docker basics, launching a container and stopping it.
```

There's no `setup.sh` and no `data` directory, so this lab runs on the shared disk, like `basics`. Docker comes preinstalled on the shared disk, along with Ubuntu, so the lab doesn't need a disk of its own.

## The lesson

`index.md` runs one container from start to finish. Each step is a `shell` block the learner can run:

1. `docker ps` lists running containers. The list is empty.
2. `docker run -d --name web -p 8080:80 nginx` starts nginx in a container named `web`. `-d` leaves it running after the command returns, and `-p 8080:80` publishes its port 80 on port 8080 of the machine.
3. `docker ps` again, and `web` is in the list.
4. `curl http://127.0.0.1:8080/` fetches the page the container serves. `127.0.0.1` is the machine the learner is logged into.
5. `docker stop web` and `docker rm web` stop the container and remove it.

The lesson explains each flag right before the command that uses it. Do the same in your own lessons: the learner reads the sentence, then clicks Run.

## Open it

```shell
./trylab docker
```

If you already opened `basics`, the shared disk exists, so the lab starts without a build.

## What you should see

The banner says Intro to Docker. Run the steps in order.


`curl` prints the HTML of nginx's stock welcome page, with the heading "Welcome to nginx!".

Press Ctrl-C in the terminal where `trylab` is running to stop the lab.

Next, [nginx](nginx.md) installs software while its disk is built.
