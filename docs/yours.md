# Write your own

Make a directory next to `trylab`. The directory name is the lab's name. Use letters, digits, and hyphens. Leave the name `default` for the shared disk.

Write `config.yaml` with a `title` and a `description`. Write `index.md` as the lesson. Put commands the learner should run in a block tagged `shell`, so the page gives them a Run button.

Open it:

```shell
./trylab your-lab
```

That is a complete lab when the shared disk already has what the lesson needs.

Add another file only when the lesson needs it.

- Add `setup.sh` when the lesson needs software installed. The script runs while the disk is built. The first time you open the lab, `trylab` says that disk is missing and asks `Build it now?`. Press Enter to build it.
- Add files under `data/` when the lesson should find them already on the machine. They are copied to `/root/data/` during that same build.
- Add `snapshot: true` when a program should already be running at the moment the page opens. The first open saves the machine after login. The next open resumes that save.
- Add a `services` entry when the learner needs a link to a page the machine is serving. The link shows the name you give it and opens that port.

The examples in the pack are short on purpose. A lab you publish should teach its subject. Keep the files around the lesson only as large as that subject needs.
