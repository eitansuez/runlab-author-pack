# config.yaml

`config.yaml` sits next to `index.md`. The file is optional. With no file, the catalog and the banner show the directory name. The machine uses the usual size and the shared disk.

A lab name is the directory name. Use letters, digits, and hyphens. The name `default` is reserved for the shared disk.

## title

The name on the catalog card, and in the banner at the top of the lab page. If you leave it out, both show the directory name.

## description

The sentence under the title on the catalog card.

## author

Who wrote the lab. The lab's own page shows it. The catalog list does not.

## tags

Categories for the lab. Write one name, or a list:

```yaml
tags: kubernetes
```

```yaml
tags:
  - kubernetes
  - networking
```

Names are compared without regard to case, and a repeated name is kept once. The lab's own page shows them. The catalog list does not.

## services

Links in the bar above the lesson. Each entry has a `name`, a `port`, and a `path`.

`name` is the word on the link. It is required. `port` is the port on the lab machine, from 1 to 65535. Each port can appear once. `path` is the path on that port. It starts with `/`. If you leave it out, the link uses `/`.

The link opens in a new tab.

```yaml
services:
  - name: nginx
    port: 80
    path: /
```

## env

Variables to set on the lab machine when the lab starts. They are placed in the shell for that run. They are not stored on the disk.

A value that begins with `$` is taken from a value you provide, not from this file. The name after `$` has to be a shell variable name. If that value is missing or empty, the lab does not start.

Any other value is plain text, and that text lives in `config.yaml`. Do not put a secret there. Use a `$` value for a secret, and store the secret with `runlabctl`.

```yaml
env:
  API_TOKEN: $API_TOKEN
```

The name on the left is a shell variable name. It starts with a letter or an underscore, and the rest is letters, digits, and underscores.

## snapshot

`snapshot: true` saves the machine once the pack can log in. Later opens resume that save. Leave the line out to boot from the disk every time.

Save the machine at a moment that is worth keeping. If a program should already be running, `setup.sh` has to make the machine accept the login only after that program is up. The nginx example does this for nginx.

On your computer, the first time `trylab` opens the lab, it writes the snapshot. On the published site, Build writes it, and Publish waits until that save exists.

## memory_mib

How much memory the machine gets, in MiB. If you leave it out, or set it to 0, the machine gets 1024. The number has to be positive. A change applies the next time the lab opens. It does not need a new disk.

## vcpus

How many CPUs the machine gets. If you leave it out, or set it to 0, the machine gets 2. The number has to be positive. A change applies the next time the lab opens. It does not need a new disk.

## disk_gib

The size of the lab's disk, in GiB. If you leave it out, the disk is 8 GiB. Set a positive number to choose another size. Changing it means building the disk again.

## disk_name

Which disk the lab boots. The name uses letters, digits, and hyphens.

If you leave it out, a lab with no `setup.sh` and no file under `data/` uses `default`, the shared disk. If you leave it out on any other lab, the disk is named after the lab directory. Set the field to `default` when you want that shared disk on purpose.

On your own computer, if `disk_name` names some other lab's disk, `trylab` prints that name and does not write a second copy.

## badge_id

Leave this out unless you have been given a badge identifier. When a learner finishes a lab that sets it, the site can award that badge.

## time_limit

How long one lab stays open. Write a duration such as `5m` or `300s`. The duration has to be positive.

If you leave it out, the lab uses the usual length. A published lab is shortened to the length the site allows.

## What makes a new disk

Press Build when `setup.sh`, a file under `data/`, or `disk_gib` changes, and when you turn a snapshot on. The lesson, the title, the description, services, and environment names are read when the lab opens. Those do not need a new disk.
