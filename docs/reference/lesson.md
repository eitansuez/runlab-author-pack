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

A service in `config.yaml` can appear in the bar above the lesson. It can also be a link in the lesson, at the step where the learner should open it. Both open in a new tab.

The short name comes from the service name. The name is lowercased. Spaces, underscores, and hyphens become a single hyphen. Anything else is left out. `Agentgateway UI` is `agentgateway-ui`.

```markdown
Open the [Agentgateway UI](service:agentgateway-ui).
```

`header: false` on that service keeps it out of the bar. Leave the flag out, and the bar shows the link from the start. A link that doesn't match a service stops the lab from opening. An example inside a fenced code block is not a link.

Inside the shell, you can reach that same port at `127.0.0.1`, because that's the machine you're on.
