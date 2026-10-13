# config.yaml

`config.yaml` sits next to `index.md`, and it's optional. Without it, the catalog and the banner show the directory name, and the machine uses the usual size and the shared disk.

The lab's name is its directory name. Use letters, digits, and hyphens; the name `default` is reserved for the shared disk.

## title

The name shown on the catalog card and in the banner at the top of the lab page. If you leave it out, both show the directory name instead.

## description

The sentence shown under the title on the catalog card.

## author

Who wrote the lab. It appears on the lab's own page, but not in the catalog list.

## tags

Categories for the lab. You can write a single name or a list:

```yaml
tags: kubernetes
```

```yaml
tags:
  - kubernetes
  - networking
```

Names are compared without regard to case, and a repeated name is kept only once. Tags appear on the lab's own page, but not in the catalog list.

## services

Links in the bar above the lesson. Each entry has a `name`, a `port`, and a `path`.

`name` is the text of the link, and it's required. `port` is the port on the lab machine, from 1 to 65535, and each port can appear only once. `path` is the path on that port and starts with `/`; if you leave it out, the link uses `/`.

The link opens in a new tab.

```yaml
services:
  - name: nginx
    port: 80
    path: /
```

## env

Variables to set on the lab machine when the lab starts. They're placed in the shell for that run and never stored on the disk.

A value that begins with `$` is taken from a value you provide rather than from this file. The name after `$` has to be a valid shell variable name, and if that value is missing or empty, the lab won't start.

Any other value is plain text that lives in `config.yaml`, so don't put a secret there. For a secret, use a `$` value and store the secret with `runlabctl`.

```yaml
env:
  API_TOKEN: $API_TOKEN
```

The name on the left is a shell variable name: it starts with a letter or an underscore, followed by letters, digits, and underscores.

## snapshot

`snapshot: true` saves the machine as soon as the pack is able to log in, and later opens resume that save. Leave the line out to boot from the disk every time.

Make sure the save happens at a moment worth keeping. If a program should already be running, `setup.sh` has to make the machine accept the login only after that program is up. The nginx example does exactly this for nginx.

On your computer, `trylab` writes the snapshot the first time it opens the lab. On the published site, Build writes it, and Publish waits until that save exists.

## memory_mib

How much memory the machine gets, in MiB. If you leave it out or set it to 0, the machine gets 1024. Otherwise the number has to be positive. A change takes effect the next time the lab opens and doesn't need a new disk.

## vcpus

How many CPUs the machine gets. If you leave it out or set it to 0, the machine gets 2. Otherwise the number has to be positive. A change takes effect the next time the lab opens and doesn't need a new disk.

## disk_gib

The size of the lab's disk, in GiB. If you leave it out, the disk is 8 GiB; set a positive number to choose another size. Changing it means building the disk again.

## disk_name

Which disk the lab boots from. The name uses letters, digits, and hyphens.

If you leave it out, a lab with no `setup.sh` and no file under `data/` uses `default`, the shared disk, and any other lab gets a disk named after its directory. Set the field to `default` when you want the shared disk on purpose.

On your own computer, if `disk_name` names another lab's disk, `trylab` prints that name and doesn't write a second copy.

## badge_id

Leave this out unless you've been given a badge identifier. When a learner finishes a lab that sets it, the site can award that badge.

## time_limit

How long a single run of the lab stays open. Write a positive duration such as `5m` or `300s`.

If you leave it out, the lab uses the usual length. On the published site, a longer limit is shortened to the length the site allows.

## What makes a new disk

Press Build when `setup.sh`, a file under `data/`, or `disk_gib` changes, or when you turn a snapshot on. On your own computer, `trylab` does that build the next time you open the lab. The lesson, the title, the description, services, and environment names are read each time the lab opens, so changing them doesn't need a new disk.
