# Prepare the machine

The shared disk already has Ubuntu and Docker. When a lesson needs something else, you install it while the disk is built. The learner then finds it already there.

The `nginx` example is that kind of lab. Its lesson expects a web server to be running when the page opens.

## A script that runs during the build

`setup.sh` is a shell script in the lab directory. It runs once, as root, while the disk is being built. It can use the network. It does not run again when a learner opens the lab.

`nginx/setup.sh` installs nginx. It also adds one line to nginx's welcome page, so you can tell that page from a normal nginx page. Read the file in the pack. That is the one to copy from.

## Files the lesson needs

If the lab has a `data` directory, those files are copied to `/root/data/` on the machine during the build. Put files there when the lesson should find them already on the disk. An empty `data` directory adds nothing. `nginx` does not use one.

A lab with `setup.sh`, or with any file under `data`, gets its own disk. The disk is named after the lab.

## The lab's disk

The first time you run `./trylab nginx`, it tells you nginx's disk does not exist yet and asks `Build it now?`. Press Enter. That writes a disk named `nginx`. The shared disk is left alone.

## A snapshot

Opening a lab normally starts the machine from its disk, which includes a boot. A snapshot is a save taken after the machine has booted and your software is running. The next open resumes that save. The learner does not wait for the boot, and the program is already running.

Write `snapshot: true` when you want that save. The first time you open the lab, `trylab` boots the machine, waits until it can log in, and writes the snapshot. That takes a while. The next open resumes it.

The save is taken at the moment the pack can log in. `nginx/setup.sh` makes that login wait until nginx is running, so the saved machine already has the server listening. Copy that pattern when some other program has to be up before the save.

## A link to a page the machine is serving

You can put a link in the bar above the lesson. The link opens in a new tab. It points at a port on the lab's machine.

In `config.yaml`, each link has three fields. `name` is the word on the link. `port` is the port on the machine. `path` is the path on that port, and it starts with `/`. If you leave `path` out, the link uses `/`.

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

The first run builds the disk if it is missing, saves the snapshot, and then prints the page address. Click `nginx` in the bar. The new tab is nginx's welcome page, including the line the setup script added.

In the shell, `curl http://127.0.0.1/` fetches that same page. `127.0.0.1` is the machine you are logged into.
