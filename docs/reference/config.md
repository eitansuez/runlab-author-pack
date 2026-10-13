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

Links to a page the lab machine is serving. Each entry has a `name`, a `port`, and a `path`.

`name` is the text of the link in the bar, and it's required. `port` is the port on the lab machine, from 1 to 65535, and each port can appear only once. `path` is the path on that port and starts with `/`; if you leave it out, the link uses `/`.

The bar link opens in a new tab. Set `header: false` when that page is not up at the start of the lab. The link stays out of the bar, and you can still place it in the lesson.

The lesson link uses a short name made from `name`. The name is lowercased. Spaces, underscores, and hyphens become a single hyphen. Anything else is left out. `Agentgateway UI` is `agentgateway-ui`.

```markdown
Open the [Agentgateway UI](service:agentgateway-ui).
```

That link opens in a new tab, on the port and path from this file. A link that doesn't match a service stops the lab from opening. So does a pair of services that shorten to the same name. An example inside a fenced code block is not a link.

```yaml
services:
  - name: Agentgateway UI
    port: 4000
    path: /ui
    header: false
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

## snapshots

`snapshots` is a list of names. Each name is a short word of letters, digits, and hyphens, and the name is also the file. `serving` is the file `story/serving.sh`.

```yaml
snapshots:
  - serving
  - gateway
```

The build boots the disk, runs `story/serving.sh` in the machine, and saves the machine when that file finishes with no error. The save is called `serving`. The next name runs on that same machine, and the build saves again. That save is called `gateway`.

One name opens the lab at that save. More than one name is a course on this disk. Write `resume` with the name of the save this lab opens at.

```yaml
resume: serving
```

Leave the list out and the lab boots from the disk every time. A line that says `snapshot:` is refused. Write the list.

On your computer, `trylab` writes the saves the first time it opens the lab. On the published site, Build writes them, and Publish waits until those saves exist.

A change to a story script doesn't build a new disk. The build takes that save again, and every save after it. An earlier save stays.

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

Press Build when `setup.sh`, a file under `data/`, or `disk_gib` changes. That builds the disk again and takes the saves again. Press Build when a story script changes. The disk stays, and the saves from that script on are taken again.

On your own computer, `trylab` does that work the next time you open the lab. The lesson, the title, the description, services, and environment names are read each time the lab opens, so changing them doesn't need a new disk or a new save.
