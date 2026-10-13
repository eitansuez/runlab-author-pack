# Your first lab

Each lab is a directory that sits next to `trylab`, and the directory's name becomes the lab's name. Stick to letters, digits, and hyphens, and avoid `default`, which is reserved for the shared disk.

The pack includes a finished lab called `basics`, so you can see what one looks like. It has just two files.

## config.yaml

`config.yaml` holds the lab's title and description, which is how learners recognize it before they open it.

The `title` appears in two places: in the catalog, which is the list of labs a learner picks from, and in the banner at the top of the lab page. The `description` is the sentence shown under the title in the catalog.

```yaml
title: Unix command basics
description: Learn the basics of Unix commands ls, cd, mkdir and friends.
```

That's the entire file for `basics`. Because this lab doesn't install any software, it runs on the shared disk. The first time you open it, `trylab` notices that the shared disk doesn't exist yet and asks `Build it now?`. Press Enter to build it.

## The lesson

`index.md` is the lesson the learner reads. It's written in Markdown, so you can use headings, lists, and code blocks. The lesson in the pack is a short walk through `pwd`, `ls`, `mkdir`, and `cd`.

When you want the learner to run a command, put it in a code block tagged `shell`:

````markdown
```shell
pwd
```
````

On the lab page, that block gets two buttons: Copy puts the command on the clipboard, and Run types it into the shell and presses Enter for the learner.

Blocks tagged `bash`, `sh`, `zsh`, or `ksh` get the same buttons. A block with any other tag, or with no tag at all, is shown as plain text that the learner can copy but not run.

Links in the lesson open in a new browser tab.

Because the lesson is read from `index.md` each time the lab opens, and isn't stored on the disk, you can edit the wording as often as you like without rebuilding the disk.

## Open it

Run `trylab` with the lab's name to start it:

```shell
./trylab basics
```

`trylab` runs as your own user. If you start it with sudo, it switches back to your user before writing a disk, so the files you end up with are still yours.

If a program the pack needs isn't installed yet, `trylab` offers to run `./prereqs` for you. Answer yes, and the installer will ask for your password.

Once the machine is up, `trylab` prints a line like this:

```text
open http://localhost:8080/sessions/…/
```

Open that address in your browser. You're logged in as root on the lab machine, the banner says Unix command basics, and the lesson sits beside the shell.

When you're done, press Ctrl-C in the terminal where `trylab` is running to stop the lab.

## Docker is already on the machine

The pack's second example, `docker`, is built the same way: a title, a description, and a lesson. This lesson starts a container.

Docker comes preinstalled on the shared disk, so this lab doesn't need a disk of its own either.

```shell
./trylab docker
```

The first time the lesson runs `docker run`, the machine downloads the image, so it needs a network connection.
