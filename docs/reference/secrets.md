# Secrets

`runlabctl` stores a secret for the account that publishes a lab, and also keeps a copy on your computer for local use. It reads values from the terminal and never prints them, so `secret list` shows the names only.

Run it from the pack directory.

```shell
./runlabctl login
./runlabctl logout
./runlabctl whoami
./runlabctl secret list
./runlabctl secret add NAME
./runlabctl secret update NAME
./runlabctl secret delete NAME
```

`login` opens a browser page on the site where you publish. Once a local page says you're signed in, you can close it. The sign-in is kept under `~/.config/runlab/`; `logout` deletes it, and `whoami` prints the email of the signed-in account.

`secret add` and `secret update` prompt with `Value:` when you're at a terminal, or take one line if you pipe a value in, and they refuse an empty value. `update` replaces the stored value of a name that already exists, and `delete` removes the name.

The name has to be a shell variable name: it starts with a letter or an underscore, followed by letters, digits, and underscores.

A published lab receives the values stored for the account that connected its repository, but the catalog sends it only the names it lists under `env`. If one of those names has no value, the lab won't start. A lab that is already open keeps the values it started with.

On the lab machine, the values are written to `/root/.lab-env` for that run, and the disk never contains them.

`secret add`, `secret update`, and `secret delete` also update `~/.config/runlab/lab-env` for the account that ran `runlabctl`. A local `./trylab` reads that file, and if a name is in it, the lab receives that value. [Commands](trylab.md) shows how to set the variable in the shell instead.

In `config.yaml`, point the lab at the value you saved:

```yaml
env:
  API_TOKEN: $API_TOKEN
```

A value without a leading `$` is stored in the file as plain text, so always keep a secret in the `$` form.
