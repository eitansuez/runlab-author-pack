# runlab author pack

This pack lets you build, develop, and test labs on your own machine. When a lab is ready, you publish it at runlabs.io.

Run every command from this directory.

The programs you use are `trylab` and `packer`.

The microVM runs Ubuntu, with Docker already installed. `./packer/build.sh` builds that disk, and the first build also writes the kernel. When a lab needs other software installed on the disk before it opens, `./packer/build.sh <lab>` builds a disk for that lab.

`./trylab` serves the catalog at `http://127.0.0.1:8080`. `./trylab <lab>` opens that lab. The page has the lesson, a terminal, and a link for each service.

This directory contains `trylab`, `prereqs`, `tap`, `packer/`, and three example labs: `basics`, `docker`, and `nginx`.

## Prerequisites

The author pack runs only on Linux x86_64 with KVM. The account that runs a build needs access to `/dev/kvm`. The first build needs the network.

## Dependencies

Run `./prereqs`. It installs Packer and writes `firecracker` into this directory. apt asks for your password.

## Lab key

```
ssh-keygen -t ed25519 -f ssh-key -N "" -C "lab"
```

`trylab` logs in as root with `ssh-key`.

## Tap

`sudo ./tap` creates tap0 and the forwarding a lab uses to reach the network.

A reboot clears these settings.

## A lab

A lab is a directory next to `trylab`. The directory name is the lab name: letters, digits, and hyphens.

`index.md` is the lesson. `setup.sh` installs extra software onto the disk. `data/` is copied to `/root/data/` in the guest.

`config.yaml` is the lab's metadata and guest settings. `title` and `description` are the catalog card. It can also set `author`, `tags`, `badge_id`, `memory_mib`, `vcpus`, `disk_gib`, and `time_limit`. `disk_name` names the disk this lab boots. A lab with no `setup.sh` and no `data/` uses `default` when the line is left out. A lab with `setup.sh` and no `disk_name` builds a disk with the same name as the lab. `snapshot: true` saves the guest once SSH is up, and the next open resumes that save.

`basics` and `docker` have no `setup.sh`, so they use the default disk. `nginx` adds `setup.sh`, asks for a snapshot, and exposes a service.

## Build and open

Build the default disk and kernel for the VM with:

```
./packer/build.sh
```

Then you can run basics:

```
./trylab basics
```

The program prints `open http://localhost:8080/sessions/<id>/`. Open that address. Ctrl-C stops the lab.

docker uses that same disk:

```
./trylab docker
```

For nginx:

```
./packer/build.sh nginx
./trylab nginx
```

`nginx/config.yaml` exposes the server:

```yaml
snapshot: true
services:
  - name: nginx
    port: 80
    path: /
```

`name` is used as the label for the link provided to the student in the lesson ui. `port` is the guest port. `path` is the path on that port. The link opens nginx's welcome page. The server is already running.

## Publishing your labs

Create a public GitHub repository. Put one lab in each child directory, with the same files as the examples. Push the repository. It holds the labs. It does not need `trylab`, `packer`, or the disks you built here.

Sign in at runlabs.io. On your profile, enter the repository URL. The site lists the labs it finds there.
