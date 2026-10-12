# Install the pack

Download the latest pack and unpack it. Run every command from that directory.

https://github.com/eitansuez/runlab-author-pack/releases/latest

You will find three programs: `trylab`, `runlabctl`, and `prereqs`. You will also find three example labs: `basics`, `docker`, and `nginx`. A `packer` directory is there too. `trylab` uses it when it builds a disk. You do not run it yourself.

## Tools

Run `./prereqs`. It installs the programs that build the lab machine and start it. It prints the name of each package before it installs that package.

One of those programs is Firecracker. Firecracker is what runs the lab machine. The installer saves it in this directory as `firecracker`.

apt asks for your password. `./prereqs` also sets up the lab network for your account. After that, you run `./trylab` as yourself.

Later, when you open a lab, `trylab` checks that those programs are installed. If one is missing, it asks whether to run `./prereqs`. Answer yes to install them. Press Enter to leave them uninstalled.

Your account also needs to be able to use `/dev/kvm`. That is how Linux starts the lab machine. If it cannot, `./prereqs` says so at the end.

## The login key

The pack logs in to the lab machine as root. Root is the administrator account on that machine. The login uses a key file named `ssh-key` in the pack directory. The first disk build creates that file if it is not already there.

## The shared disk

A disk is the lab machine's files, stored as one file on your computer. A lab boots a copy of a disk.

Labs that do not install their own software share one disk. Its name is `default`. The machine on that disk is Ubuntu. Docker is already installed, along with curl and other ordinary tools.

The first time you open one of those labs, `trylab` tells you the disk does not exist yet. It asks `Build it now?`. Press Enter. The build needs the network, and it takes a while. That first build also saves the kernel, the program the machine boots with. Later builds reuse that kernel.
