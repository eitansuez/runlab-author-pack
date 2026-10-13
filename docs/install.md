# Install the pack

Download the latest pack and unpack it. You'll run every command in this manual from that directory.

https://github.com/eitansuez/runlab-author-pack/releases/latest

Inside you'll find three programs, `trylab`, `runlabctl`, and `prereqs`, along with three example labs: `basics`, `docker`, and `nginx`. There's also a `packer` directory, which `trylab` uses when it builds a disk, so you never need to run it yourself.

## Tools

Run `./prereqs` to install the programs that build the lab machine and start it. It prints the name of each package before installing it, so you can see what it's doing.

One of those programs is Firecracker, which is what actually runs the lab machine. The installer saves it in this directory as `firecracker`.

apt will ask for your password. `./prereqs` also sets up the lab network for your account, which means that afterwards you can run `./trylab` as yourself.

Later, whenever you open a lab, `trylab` checks that those programs are still installed. If one is missing, it asks whether to run `./prereqs`: answer yes to install them, or press Enter to leave them uninstalled.

Your account also needs access to `/dev/kvm`, because that's how Linux starts the lab machine. If your account can't use it, `./prereqs` tells you so at the end.

## The login key

The pack logs in to the lab machine as root, the administrator account on that machine. To do that it uses a key file named `ssh-key` in the pack directory, which the first disk build creates if it isn't already there.

## The shared disk

A disk holds the lab machine's files, stored as a single file on your computer, and each lab boots from a copy of one.

Labs that don't install their own software all share one disk, named `default`. The machine on that disk runs Ubuntu and comes with Docker already installed, along with curl and other everyday tools.

The first time you open one of those labs, `trylab` tells you the disk doesn't exist yet and asks `Build it now?`. Press Enter to build it. The build needs a network connection and takes a while. That first build also saves the kernel, the program the machine boots with, so later builds can reuse it.
