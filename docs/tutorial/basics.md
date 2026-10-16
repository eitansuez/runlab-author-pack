# basics

`basics` is the smallest lab in the pack. It has just two files, `config.yaml` and `index.md`.

## config.yaml

`config.yaml` holds the lab's title and description, which is how learners recognize it before they open it.

```yaml
title: Unix command basics
description: Learn the basics of Unix commands ls, cd, mkdir and friends.
```

The `title` appears in two places: in the catalog, which is the list of labs a learner picks from, and in the banner at the top of the lab page. The `description` is the sentence shown under the title in the catalog.

That's the entire file. Because this lab doesn't install any software, it runs on the shared disk.

## The lesson

`index.md` is the lesson the learner reads. It's written in Markdown, so you can use headings, lists, and code blocks. The lesson in `basics` is a short walk through `pwd`, `ls`, `mkdir`, and `cd`. Each step is a heading, a sentence or two, and a command:

````markdown
## Listing directories

With the `ls` command we can list the contents of the working directory:

```shell
ls
```
````

When you want the learner to run a command, put it in a code block tagged `shell`. On the lab page, that block gets two buttons: Copy puts the command on the clipboard, and Run types it into the shell and presses Enter for the learner.

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

The first time you open a lab on the shared disk, `trylab` notices that the shared disk doesn't exist yet and asks `Build it now?`. Press Enter to build it. The build needs the network and takes a while. Later opens reuse the disk.

Once the machine is up, `trylab` prints a line like this:

```text
open http://localhost:8080/sessions/…/
```

## What you should see

Open that address in your browser. You're logged in as root on the lab machine, the banner says Unix command basics, and the lesson sits beside the shell.

Click Run on the `pwd` block. The command appears in the shell and runs. Work down the lesson: `mkdir my-folder` adds a directory, the second `ls` lists it, and after `cd my-folder`, `pwd` shows you're inside it.

Try changing a sentence in `index.md`, then stop the lab and open it again. The new wording shows up without a rebuild.

When you're done, press Ctrl-C in the terminal where `trylab` is running to stop the lab.

Next, [docker](docker.md) uses software that's already on the machine.
