# Publish

Once the lab works on your computer, it's time to put it where other people can open it.

The site reads labs from a public repository on GitHub, which is where the project's files are stored online. Git keeps track of those files on your computer, and a push sends them up to GitHub.

## Put the lab on GitHub

Create a public repository and put each lab in its own directory. Use the same files you used on your computer: `index.md`, `config.yaml`, and `setup.sh` or `data/` if the lab has them.

Then push the repository. It only needs to hold the labs, not `trylab`, `packer`, or the disks you built, because the site builds its own disks.

## Tell the site which repository to read

Sign in at https://runlabs.io using the Log in with Google button.

Open your profile from the account menu and choose Author settings. Enter the repository as `owner/name` and save it, and the site reads the repository and lists the labs it finds.

## Build the disk on the site

Open the Labs tab, then open a lab.

Press Build to make the disk on the site. Building doesn't publish the lab, so learners can't open it yet. A build can take several minutes.

A lab that uses the shared disk is ready as soon as that one disk exists on the site, and later labs reuse it. A lab with its own disk has to wait until its own build has finished.

If the lab has `snapshot: true`, Build also saves the snapshot, and Publish stays unavailable until that save exists.

When the page says the lab is ready to publish, press Publish. The lab joins the catalog, and learners can open it.

## After you change the lab

Push the change to GitHub, then press Refresh repository on the Labs tab so the site reads the repository again.

A change to the lesson, the title, the description, or a service link is picked up the next time someone opens the lab, so you don't need to press Build for it.

Press Build when the change is part of the disk, which means you changed `setup.sh`, a file under `data/`, or the disk size, or you turned a snapshot on. The new disk replaces the old one, and the lab stays published the whole time. Learners get the new disk once the build finishes.
