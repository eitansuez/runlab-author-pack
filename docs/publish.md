# Publish

When the lab works on your computer, put it where other people can open it.

The site reads the lab from a public repository on GitHub. A repository is the project's files, stored online. Git records those files on your computer, and a push sends them to GitHub.

## Put the lab on GitHub

Create a public repository. Put one lab in each directory. Use the same files you used on your computer: `index.md`, `config.yaml`, and `setup.sh` or `data/` when the lab has them.

Push the repository. It holds the labs. It does not need `trylab`, `packer`, or the disks you built. The site builds its own disks.

## Tell the site which repository to read

Sign in at https://runlabs.io. The button says Log in with Google.

Open your profile from the account menu, and choose Author settings. Enter the repository as `owner/name` and save it. The site reads the repository and lists the labs it finds.

## Build the disk on the site

Open the Labs tab, then open a lab.

Press Build. Build makes the disk on the site. It does not publish the lab, so learners cannot open it yet. A build can take several minutes.

A lab that uses the shared disk is ready once that one disk exists on the site. Later labs reuse it. A lab with its own disk waits until its own build has finished.

If the lab has `snapshot: true`, Build also saves the snapshot. Publish stays unavailable until that save exists.

When the page says the lab is ready to publish, press Publish. The lab joins the catalog, and a learner can open it.

## After you change the lab

Push the change to GitHub. Then, on the Labs tab, press Refresh repository. The site reads the repository again.

A change to the lesson, the title, the description, or a service link is picked up the next time someone opens the lab. You do not press Build for that.

Press Build when the change is part of the disk. That means you changed `setup.sh`, a file under `data/`, or the disk size, or you turned a snapshot on. The new disk replaces the old one. The lab stays published. Learners open the new disk after the build finishes.
