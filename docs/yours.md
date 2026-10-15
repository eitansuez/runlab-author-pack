# Write your own

Make a directory next to `trylab`; its name becomes the lab's name. Stick to letters, digits, and hyphens, and leave the name `default` for the shared disk.

Write a `config.yaml` with a `title` and a `description`, and write the lesson in `index.md`. Put the commands the learner should run in blocks tagged `shell`, so the page gives them a Run button.

Then open it:

```shell
./trylab your-lab
```

If the shared disk already has everything the lesson needs, that's a complete lab.

Add other files only when the lesson needs them:

- Add `setup.sh` when the lesson needs software installed. The script runs while the disk is built, so the first time you open the lab, `trylab` says that disk is missing and asks `Build it now?`. Press Enter to build it.
- Add files under `data/` when the lesson should find them already on the machine. They're copied to `/root/data/` during that same build.
- Add a name under `snapshots` when a program should already be running the moment the page opens. The name `serving` is the file `story/serving.sh`. The first open boots the machine, runs that file, and takes the snapshot. The next open resumes that snapshot. Keep that file to waiting for the program; install it in `setup.sh`.
- Add a `services` entry when the learner needs a link to a page the machine is serving. The link shows the name you give it and opens that port. In the lesson, `[Agentgateway UI](service:agentgateway-ui)` opens it at that step. Add a path after the name, as in `[logs](service:agentgateway-ui/logs)`, to open a page under the service path. Add `?name=value` after that to include a query string. `header: false` keeps it out of the bar.

The examples in the pack are short on purpose, but a lab you publish should actually teach its subject. Keep the files around the lesson only as large as that subject needs.
