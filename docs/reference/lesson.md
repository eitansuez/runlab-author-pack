# The lesson

`index.md` is the lesson. The lab page renders it as Markdown when the lab opens. The file is not copied onto the disk. After you change a published lesson, refresh the repository. The next person to open the lab sees the new text.

You are root in the shell. Root is the administrator on the machine. Your home directory there is `/root`.

## Commands

A fenced block tagged with one of these languages gets a Run button and a Copy button:

`shell`, `bash`, `sh`, `zsh`, `ksh`

Run sends each line to the shell, as if the learner had typed it and pressed Enter.

Any other tag is shown as text and can be copied. It has no Run button. That includes `console`, `json`, `yaml`, and `yml`, and a fence with no tag. Use `console` for output you want the learner to read and not run.

## Links

A link in the lesson opens in a new tab.

## A note

A quote whose first line is exactly `[!IMPORTANT]` is drawn as a labeled note. The marker is its own line. No other marker is recognized.

```markdown
> [!IMPORTANT]
> The server is already running.
```

## Services

The links to pages the machine is serving are not written in the lesson. They come from `services` in `config.yaml`, and they appear in the bar above the lesson. Each link opens in a new tab, on the port and path you named.

Inside the shell, that same port on this machine is `127.0.0.1`.
