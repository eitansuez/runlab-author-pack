# Commands

Run these from the pack directory, the directory that contains `trylab`.

## prereqs

```shell
./prereqs
```

This installs the build tools and writes `firecracker` into the pack directory. It prints the name of each package before it installs that package. QEMU is the program that builds the disk. Packer drives that build. apt asks for your password. The command expects a 64-bit PC with Linux. At the end it checks that this account can use `/dev/kvm`.

It also sets up the lab network for this account, and prepares `/run/netns`. After a reboot, that directory is created again.

`trylab` asks when one of these programs is missing, and when the network setup is missing. One missing program asks `Install it with ./prereqs? [y/N]`. More than one asks `Install them with ./prereqs? [y/N]`. Answer `y` or `yes` to run `./prereqs`. Any other answer, including Enter, leaves them uninstalled. If there is no terminal, `trylab` stops and names what is missing.

## The login key

`trylab` logs in as root with the private key `ssh-key` in the pack directory. A build writes that file when it is missing.

## Build a disk

`trylab` builds a missing disk before the lab starts. The shared disk is `filesystems/default.ext4`. A lab with its own disk gets `filesystems/<lab>.ext4`.

If `trylab` had to write a new `ssh-key`, and a disk was already there, it builds that disk again. The new key has to be on the disk.

A later change to `setup.sh`, a file under `data/`, or `disk_gib` builds that lab's disk again before the lab starts. The snapshot is taken again after that build. A disk built by an older `trylab` has no record of those files, so the next open builds it once more.

A lab that uses another disk, including `default`, does not get a second copy of that disk.

The first build of any disk also writes the kernel and the initrd. The initrd is the small filesystem that mounts the disk at boot. Later builds reuse both.

The build needs the network. During the build, files from `data/` are unpacked to `/root/data/`, and then `setup.sh` runs as root.

## trylab

```shell
./trylab basics
./trylab
```

With a lab directory, `trylab` checks that `index.md` exists. When `ssh-key` is missing, it writes that key. When the lab's disk is missing, it says the file does not exist and asks `Build it now? [Y/n]`. Press Enter, or answer `y`, to build the disk. `n` leaves the disk unbuilt. With no terminal, the note is printed and the build starts.

For a lab with `snapshot: true`, it writes a snapshot when the one on disk is missing or out of date, and then opens the lab. It prints:

```text
open http://localhost:8080/sessions/…/
```

Open that address. The banner is the lab's title. The page has the lesson, the shell, and a link for each service.

With no argument, `trylab` starts the local catalog at `http://127.0.0.1:8080` and waits. Ctrl-C stops it. Ctrl-C stops a lab the same way.

`./trylab` runs as you. If you start it with sudo, it switches back to your user before it writes a disk. `./prereqs` is what sets up the lab network. The lab machine's address on that network is `172.16.0.2`.

To pass a secret from your shell, set it and then open the lab:

```shell
export API_TOKEN=…
./trylab your-lab
```

`trylab` also reads `~/.config/runlab/lab-env`. If a name is in that file, the lab receives that value. [Secrets](secrets.md) describes the file.

## The shared machine

The `default` disk is Ubuntu. These are installed:

- Docker (`docker.io`)
- curl, ca-certificates, jq, tree, vim
- bat (also as `bat`, when the package installed `batcat`)
- yq
- zellij
- bash completion, an OpenSSH server, and common compression tools

A lab with no `setup.sh` and no file under `data/` boots this disk. Docker is available. An image the lesson pulls still has to be downloaded, and that download needs the network.
