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
- Add `snapshot: true` when a program should already be running the moment the page opens. The first open saves the machine once it can log in, and every open after that resumes the save.
- Add a `services` entry when the learner needs a link to a page the machine is serving. The link shows the name you give it and opens that port.

The examples in the pack are short on purpose, but a lab you publish should actually teach its subject. Keep the files around the lesson only as large as that subject needs.
