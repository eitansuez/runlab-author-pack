# An API key

Some lessons call an API, and that call needs a key.

Don't put the key in the git repository, and don't put it on the disk. Instead, the lab receives the key when it starts, from a value you've saved.

## Name the variable

In `config.yaml`, name the variable the lesson will read:

```yaml
env:
  API_TOKEN: $API_TOKEN
```

The name on the left is the variable on the lab machine. `$API_TOKEN` means the value comes from you rather than from this file. The two names can be the same word.

If you haven't provided a value, the lab won't start.

When the lab starts, the value is set in the shell and also written to `/root/.lab-env` for that one run of the lab. The disk you built never contains it.

## Try it on your computer

Set the value in your terminal, then open the lab:

```shell
export API_TOKEN=…
./trylab your-lab
```

If you saved the value with `runlabctl`, it's kept in `~/.config/runlab/lab-env`, and the lab uses that saved value.

## Save it for learners

`runlabctl` stores the value for the account you publish with. It reads the value from the terminal and doesn't print it, so the key never shows up on screen.

```shell
./runlabctl login
./runlabctl secret add API_TOKEN
```

`login` opens a browser on the site. Sign in, and close the window when it tells you that you can. `secret add` then asks for the value.

When a learner opens the lab, the variable is set from the value you saved. A lab that's already open keeps the value it started with.

The reference lists every `config.yaml` field, how the lesson is written, and the commands. To replace a value, remove one, or list the names you've stored, see the [Secrets](reference/secrets.md) page.
