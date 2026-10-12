# Your first lab

A lab is a directory next to `trylab`. The directory's name is the lab's name. Use letters, digits, and hyphens. Do not use the name `default`. That name belongs to the shared disk.

The `basics` directory is a finished lab. It has two files.

## config.yaml

`config.yaml` is how the lab introduces itself.

`title` is the name a learner sees in the list of labs, and in the banner at the top of the lab page. That list is the catalog. `description` is the sentence under the title.

```yaml
title: Unix command basics
description: Learn the basics of Unix commands ls, cd, mkdir and friends.
```

That is the whole file for `basics`. This lab does not install any software, so it uses the shared disk. The first time you open it, `trylab` says that disk is missing and asks `Build it now?`. Press Enter to build it.

## The lesson

`index.md` is the lesson the learner reads. It is Markdown, which means headings, lists, and blocks of code. The file in the pack is a short walk through `pwd`, `ls`, `mkdir`, and `cd`.

When the learner should run a command, put the command in a block tagged `shell`:

````markdown
```shell
pwd
```
````

On the lab page, that block has two buttons. Copy puts the command on the clipboard. Run types it into the shell and presses Enter.

A block tagged `bash`, `sh`, `zsh`, or `ksh` works the same way. A block with any other tag, or with no tag, is shown as text. The learner can copy it. It does not get a Run button.

A link in the lesson opens in a new browser tab.

The lesson is read from `index.md` when the lab opens. It is not stored on the disk. You can change the words without building the disk again.

## Open it

`trylab` starts the lab. It runs as you. If you start it with sudo, it switches back to your user before it writes a disk.

```shell
./trylab basics
```

If a program from the install is missing, `trylab` asks whether to run `./prereqs`. Answer yes and the installer runs. It asks for your password.

When the machine is up, `trylab` prints a line like this:

```text
open http://localhost:8080/sessions/…/
```

Open that address. You are logged in as root on the lab machine. The banner says Unix command basics. The lesson is on the page, and the shell is beside it.

To stop the lab, press Ctrl-C in the terminal where `trylab` is running.

## Docker is already on the machine

`docker` is a second lab, made the same way. It has a title, a description, and a lesson. The lesson starts a container.

Docker is already installed on the shared disk, so this lab does not need a disk of its own.

```shell
./trylab docker
```

The first time that lesson runs `docker run`, the machine downloads an image. The download needs the network.
