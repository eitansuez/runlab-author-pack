# Prepare the machine

The shared disk already has Ubuntu and Docker. When a lesson needs something else, you install it while the disk is being built, so the learner finds it already there when the lab opens.

The `nginx` example is that kind of lab: its lesson expects a web server to be running as soon as the page opens.

## A script that runs during the build

`setup.sh` is a shell script in the lab directory. It runs once, as root, while the disk is being built, and it can use the network. It doesn't run again when a learner opens the lab, so anything it installs is simply part of the disk.

`nginx/setup.sh` installs nginx and adds one line to nginx's welcome page, so you can tell that page apart from a stock nginx page. Read the file in the pack, since that's the one to copy from.

## Files the lesson needs

If the lab has a `data` directory, its files are copied to `/root/data/` on the machine during the build. Put files there when the lesson should find them already on the disk. An empty `data` directory adds nothing, and `nginx` doesn't use one.

Any lab with a `setup.sh`, or with any file under `data`, gets its own disk, named after the lab.

## The lab's disk

The first time you run `./trylab nginx`, it tells you nginx's disk doesn't exist yet and asks `Build it now?`. Press Enter, and it writes a disk named `nginx`, leaving the shared disk alone.

## A snapshot

Normally, opening a lab starts the machine from its disk, which means waiting for it to boot. A snapshot is a save taken after the machine has booted and your software is running, and the next open resumes from that save. That way the learner doesn't wait for a boot, and the program is already running when the page appears.

Write `snapshot: true` when you want that save. The first time you open the lab, `trylab` boots the machine, waits until it can log in, and writes the snapshot. That first open takes a while, but every open after it resumes the snapshot.

The save is taken at the moment the pack is able to log in to the machine. `nginx/setup.sh` makes that login wait until nginx is running, so the saved machine already has the server listening. Copy that pattern whenever some other program needs to be up before the save.

## A link to a page the machine is serving

You can put a link in the bar above the lesson that points at a port on the lab's machine. It opens in a new tab.

In `config.yaml`, each link has three fields: `name` is the text of the link, `port` is the port on the machine, and `path` is the path on that port, starting with `/`. If you leave `path` out, the link uses `/`.

nginx serves its welcome page on port 80, at `/`.

## The whole file

`nginx/config.yaml` puts these pieces together:

```yaml
title: Nginx basics
description: An example of a lesson with a memory snapshot - nginx running, plus a service link.
snapshot: true
services:
  - name: nginx
    port: 80
    path: /
```

## Open it

```shell
./trylab nginx
```

On the first run, `trylab` builds the disk if it's missing, saves the snapshot, and then prints the page address. Click `nginx` in the bar, and the new tab shows nginx's welcome page, including the line the setup script added.

You can fetch that same page from the shell with `curl http://127.0.0.1/`, because `127.0.0.1` is the machine you're logged into.
