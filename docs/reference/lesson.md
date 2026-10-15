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

A path after the name opens a page under the service's path. When that path is `/ui`, this opens `/ui/logs`:

```markdown
Open the [logs](service:agentgateway-ui/logs).
```

The added path is one or more pieces separated by `/`. Each piece uses letters, digits, and `-`, `_`, `.`, or `~`. A piece that is `.` or `..` is refused. A slash at the end is dropped: `service:agentgateway-ui/logs/` opens `/ui/logs`, and `service:agentgateway-ui/` is refused.

A question mark adds a query string, and a hash adds a fragment. When the service path is `/ui`, this opens `/ui/llm/analytics?groupBy=group&metric=cost`:

```markdown
Open the [cost by group](service:agentgateway-ui/llm/analytics?groupBy=group&metric=cost).
```

The query and the fragment use letters, digits, and `-`, `_`, `.`, `~`, `,`, `:`, `=`, `&`, `%`, `+`. A fragment may also contain `?`. Write those characters as themselves. A `?` or `#` with nothing after it is refused.

A link that doesn't match a service stops the lab from opening, and so does a path, query, or fragment the lab refuses.

`header: false` on that service keeps it out of the bar. Leave the flag out, and the bar shows the link from the start. The bar link opens the path from `config.yaml`, with nothing added. An example inside a fenced code block is not a link.

Inside the shell, you can reach that same port at `127.0.0.1`, because that's the machine you're on.

## Panes

The terminal on the lab page runs [Zellij](https://zellij.dev) when the machine has it, and the base disk does. A lesson can split that terminal into named panes and send a command, or a key, to one pane by name. A machine without Zellij gets an ordinary shell.

Three pieces work together:

- A layout file in `data/` that names the panes.
- A layout link in the lesson that opens that layout.
- A `panel="..."` on a shell block, or on a key link, that picks a pane by its name.

### The layout file

A layout is a Zellij layout file at `data/<name>.kdl`. Each pane gets its name with Zellij's own `name="..."` attribute. This is `agw-guardrails/data/two-pane.kdl` in the labs repository:

```kdl
layout {
  pane name="gateway" size="40%" {
    focus true
  }
  pane name="client" size="60%" {
  }
}
```

The layout file name uses letters, digits, hyphens, and underscores, and starts with a letter or a digit. Within one file, each pane name appears once and is never empty.

### The layout link

A link whose target is `zellij:<name>` opens `data/<name>.kdl` in the terminal:

```markdown
> [!IMPORTANT]
> [Configure a two-panel layout](zellij:two-pane) for the terminal.
```

Clicking it replaces the terminal's layout with that file. It doesn't start a second session.

### A command for one pane

`pane name="gateway"` is Zellij's syntax, and it lives in the `.kdl` file. `panel="gateway"` is the lesson's syntax, and it goes after the language on a shell block. The two names have to match.

````markdown
```shell panel="gateway"
agentgateway -f config-llm.yaml
```
````

Run types each line into that pane and presses Enter. Only a shell block (`shell`, `bash`, `sh`, `zsh`, `ksh`) takes a `panel`. A block without one runs in the terminal as before.

### A key for one pane

A link whose target is `key:<chord>`, followed by `{panel="..."}`, is a button that presses that key in that pane. It doesn't press Enter afterward.

```markdown
> [!IMPORTANT]
> [Stop agentgateway](key:Ctrl+C){panel="gateway"}
```

A chord is optional modifiers (`Ctrl`, `Alt`, `Shift`, `Super`) and one key: a letter, a digit, `Enter`, `Tab`, `Esc`, `Backspace`, `Space`, `Up`, `Down`, `Left`, `Right`, `Delete`, or `F1` to `F12`. `Ctrl+C`, `Ctrl-C`, and `Ctrl C` are the same chord. A key link always needs its `{panel="..."}`.

### What the lab checks when it opens

The lesson is read top to bottom. Each `panel` belongs to the closest layout link above it. The lab doesn't open, and the message names `index.md`, when:

- a `panel` has no layout link above it (`panel "gateway" needs a layout link above it`),
- the layout above it has no pane with that name (`layout two-pane has no pane named "gateway"`),
- a layout link names a file that isn't there (`layout two-pane needs data/two-pane.kdl`),
- a `panel` is on a block that isn't a shell block, or
- a key link has no `{panel="..."}` or names an unknown key.

An example inside a fenced block or inline code is not checked, so you can show the syntax in a lesson.

The check reads the lesson, not what the learner did. A learner who skips the layout link and then presses Run on a `panel` block gets `no pane named "gateway". Open its layout first`. Put the layout link before the first block that uses a `panel`, and mark it as a note so it stands out.

See `agw-guardrails` in the labs repository for a whole lesson written this way.
