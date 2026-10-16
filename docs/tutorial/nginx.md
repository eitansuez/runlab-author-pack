# nginx

The shared disk already has Ubuntu and Docker. When a lesson needs something else, you install it while the disk is being built, so the learner finds it already there when the lab opens.

`nginx` is that kind of lab: its lesson expects a web server to be running as soon as the page opens. It has four files: `config.yaml`, `index.md`, `setup.sh`, and `story/serving.sh`.

## config.yaml

```yaml
title: Nginx basics
description: Open a lab where nginx is already serving a page.
snapshots:
  - serving
services:
  - name: nginx
    port: 80
    path: /
```

`title` and `description` work as they do in [basics](basics.md). `snapshots` and `services` are new, and the sections below explain them.

## A script that runs during the build

`setup.sh` is a shell script in the lab directory. It runs once, as root, while the disk is being built, and it can use the network. It doesn't run again when a learner opens the lab, so anything it installs is simply part of the disk.

`nginx/setup.sh` does three things:

1. It installs nginx with `apt-get`.
2. It makes SSH start after nginx, so the machine accepts a login only once nginx is up.
3. It replaces the heading of nginx's welcome page, "Welcome to nginx!", with "Hello from runlab!", so you can tell that page apart from a stock nginx page.

The script stops with an error if nginx or its welcome page is missing, and an error stops the build. Read the file in the pack, since that's the one to copy from.

## Files the lesson needs

If the lab has a `data` directory, its files are copied to `/root/data/` on the machine during the build. Put files there when the lesson should find them already on the disk. An empty `data` directory adds nothing, and `nginx` doesn't use one.

Any lab with a `setup.sh`, or with any file under `data`, gets its own disk, named after the lab.

## The lab's disk

The first time you run `./trylab nginx`, it tells you nginx's disk doesn't exist yet and asks `Build it now?`. Press Enter, and it writes a disk named `nginx`, leaving the shared disk alone.

## A snapshot

Opening a lab starts the machine from its disk, which includes a boot. A snapshot is the running machine, taken after that boot, once a script you wrote has finished. The next open resumes that snapshot, so the learner skips the boot and the program is already running.

`setup.sh` builds the disk. The story is what happens after the boot. List the steps in order. Each name is a file in `story/`, so the name `serving` is the file `story/serving.sh`.

```yaml
snapshots:
  - serving
```

The build boots the disk once, runs `story/serving.sh`, and takes a snapshot under that name. A second name in the list is the next file. The build runs it on that same machine and takes another snapshot.

One name means the lab opens at that snapshot. With more than one name, `resume` picks which snapshot the lab opens at. Leave the list out and the lab boots from the disk.

`nginx/story/serving.sh` is one line that fetches the welcome page:

```bash
curl -fsS http://127.0.0.1/ >/dev/null
```

When the page answers, the script finishes with no error and the snapshot is taken.

A change to a story script leaves the disk as it is. The build takes that snapshot again, and every snapshot after it. An earlier snapshot stays.

A story script only waits. When a snapshot can't be resumed, the lab boots from the disk and the story scripts don't run, so installs and configuration belong in `setup.sh`. A script that exits with an error stops the build, and the snapshots before it are kept. See [config.yaml](../reference/config.md#snapshots) for the details.

## A link to a page the machine is serving

You can put a link in the bar above the lesson that points at a port on the lab's machine. It opens in a new tab.

In `config.yaml`, each link has a `name`, a `port`, and a `path`. `name` is the text of the link, `port` is the port on the machine, and `path` is the path on that port, starting with `/`. If you leave `path` out, the link uses `/`.

nginx serves its welcome page on port 80, at `/`, so the link is named `nginx` and points there.

The same link can sit in the lesson, at the step where the learner should open it. The `nginx` lesson has one:

```markdown
You can also [click through to the service](service:nginx) from the lab instructions.
```

To open a page under the service's path, add it after the name: `[logs](service:agentgateway-ui/logs)` opens `/ui/logs` when the service path is `/ui`. Add a query string after the path, as in `[cost by group](service:agentgateway-ui/llm/analytics?groupBy=group&metric=cost)`. Set `header: false` when that page is not running at the start. The bar leaves it out, and the learner opens it from the lesson.

## The lesson

`index.md` doesn't start anything. It shows the learner a server that is already running:

1. Click `nginx` in the bar, or the link in the lesson, to open the page.
2. `curl http://127.0.0.1/` fetches the same page from the shell, because `127.0.0.1` is the machine the learner is logged into.
3. `systemctl status nginx` shows the service is active and running.

## Open it

```shell
./trylab nginx
```

On the first run, `trylab` builds the disk if it's missing, runs the story, takes the snapshot, and then prints the page address. Later opens resume the snapshot.

## What you should see

The banner says Nginx basics, and the bar above the lesson has an `nginx` link. Click it, and the new tab shows nginx's welcome page with the heading "Hello from runlab!". That heading is how you know the page came from `setup.sh` and not from a stock install.

Run the `curl` step and the same HTML, with the same heading, appears in the shell.

Press Ctrl-C in the terminal where `trylab` is running to stop the lab.

Now you've seen every part of a lab. Next, [write your own](../yours.md).
