# The lesson

`index.md` is the lesson, and the lab page renders it as Markdown each time the lab opens. Because the file isn't copied onto the disk, you only need to refresh the repository after changing a published lesson, and the next person to open the lab sees the new text.

In the shell you're root, the administrator on the machine, and your home directory is `/root`.

## Commands

A fenced block tagged with one of these languages gets a Run button and a Copy button:

`shell`, `bash`, `sh`, `zsh`, `ksh`

Run sends each line to the shell, as if the learner had typed it and pressed Enter.

A block with any other tag, including `console`, `json`, `yaml`, and `yml`, or with no tag at all, is shown as text that can be copied but has no Run button. Use `console` for output you want the learner to read rather than run.

## Links

A link in the lesson opens in a new tab.

## A note

A quote whose first line is exactly `[!IMPORTANT]` is drawn as a labeled note. The marker must be on its own line, and no other marker is recognized.

```markdown
> [!IMPORTANT]
> The server is already running.
```

## Services

Links to pages the machine is serving aren't written in the lesson. They come from `services` in `config.yaml` and appear in the bar above the lesson, and each one opens in a new tab on the port and path you named.

Inside the shell, you can reach that same port at `127.0.0.1`, because that's the machine you're on.
