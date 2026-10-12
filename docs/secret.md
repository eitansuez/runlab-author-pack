# An API key

Some lessons call an API. That call needs a key.

Do not put the key in the git repository. Do not put it on the disk. The lab receives the key when it starts, from a value you saved.

## Name the variable

In `config.yaml`, name the variable the lesson will read.

```yaml
env:
  API_TOKEN: $API_TOKEN
```

The name on the left is the variable on the lab machine. `$API_TOKEN` means the value comes from you, not from this file. The two names can be the same word.

If you have not provided a value, the lab does not start.

When the lab starts, the value is in the shell. It is also written to `/root/.lab-env` for that one run of the lab. The disk you built does not contain it.

## Try it on your computer

Set the value in your terminal, then open the lab.

```shell
export API_TOKEN=…
./trylab your-lab
```

If you saved the value with `runlabctl`, it is kept in `~/.config/runlab/lab-env`. The lab uses that saved value.

## Save it for learners

`runlabctl` stores the value for the account you publish with. The command reads the value from the terminal and does not print it.

```shell
./runlabctl login
./runlabctl secret add API_TOKEN
```

`login` opens a browser on the site. Sign in, and close the window when it says you can. `secret add` then asks for the value.

When a learner opens the lab, the variable is set from the value you saved. A lab that is already open keeps the value it started with.

The reference lists every `config.yaml` field, how the lesson is written, and the commands. How to replace a value, remove one, or list the names you have stored is on the [Secrets](reference/secrets.md) page.
