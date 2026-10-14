# Commands

Run these from the pack directory, the directory that contains `trylab`.

## prereqs

```shell
./prereqs
```

This installs the build tools, including QEMU, which builds the disk, and Packer, which drives that build, and it writes `firecracker` into the pack directory. It prints the name of each package before installing it, and apt asks for your password. The command expects a 64-bit PC with Linux, and at the end it checks that this account can use `/dev/kvm`.

It also sets up the lab network for this account and prepares `/run/netns`. After a reboot, that directory is created again.

`trylab` asks before going on when one of these programs is missing, or when the network setup is missing. For one missing program it asks `Install it with ./prereqs? [y/N]`, and for more than one it asks `Install them with ./prereqs? [y/N]`. Answer `y` or `yes` to run `./prereqs`; any other answer, including Enter, leaves them uninstalled. If there's no terminal, `trylab` stops and names what's missing.

## The login key

`trylab` logs in as root with the private key `ssh-key` in the pack directory, and a build writes that file when it's missing.

## Build a disk

`trylab` builds a missing disk before the lab starts. The shared disk is `filesystems/default.ext4`, and a lab with its own disk gets `filesystems/<lab>.ext4`.

If `trylab` had to write a new `ssh-key` and a disk was already there, it builds that disk again, because the new key has to be on the disk.

A later change to `setup.sh`, a file under `data/`, or `disk_gib` builds that lab's disk again before the lab starts, and the snapshots are taken again after that build. A change to a story script leaves the disk, and that snapshot and every snapshot after it are taken again. A disk built by an older `trylab` has no record of those files, so the next open builds it once more.

A lab that uses another disk, including `default`, doesn't get a second copy of that disk.

The first build of any disk also writes the kernel and the initrd, the small filesystem that mounts the disk at boot, and later builds reuse both.

The build needs the network. During it, files from `data/` are unpacked to `/root/data/`, and then `setup.sh` runs as root.

## trylab

```shell
./trylab basics
./trylab
```

Given a lab directory, `trylab` checks that `index.md` exists and writes `ssh-key` if it's missing. If the lab's disk is missing, it says the file doesn't exist and asks `Build it now? [Y/n]`. Press Enter or answer `y` to build the disk, or `n` to leave it unbuilt. With no terminal, it prints the note and starts the build.

For a lab that lists `snapshots`, it takes a snapshot when that snapshot is missing or out of date, then opens the lab and prints:

```text
open http://localhost:8080/sessions/…/
```

Open that address. The banner shows the lab's title, and the page has the lesson, the shell, and a link for each service.

With no argument, `trylab` starts the local catalog at `http://127.0.0.1:8080` and waits. Ctrl-C stops it, the same way it stops a lab.

`./trylab` runs as you. If you start it with sudo, it switches back to your user before writing a disk. The lab network is set up by `./prereqs`, and the lab machine's address on it is `172.16.0.2`.

To pass a secret from your shell, set it and then open the lab:

```shell
export API_TOKEN=…
./trylab your-lab
```

`trylab` also reads `~/.config/runlab/lab-env`, and if a name is in that file, the lab receives that value. [Secrets](secrets.md) describes the file.

## The shared machine

The `default` disk runs Ubuntu, with these installed:

- Docker (`docker.io`)
- curl, ca-certificates, jq, tree, vim
- bat (also as `bat`, when the package installed `batcat`)
- yq
- zellij
- bash completion, an OpenSSH server, and common compression tools

A lab with no `setup.sh` and no file under `data/` boots this disk. Docker is ready to use, but any image the lesson pulls still has to be downloaded, so it needs the network.
