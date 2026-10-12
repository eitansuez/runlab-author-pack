# Secrets

`runlabctl` stores a secret for the account that publishes a lab. It also keeps a copy on your computer for local use. It reads values from the terminal and does not print them. `secret list` prints the names only.

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

`login` opens a browser page on the site where you publish. A local page then says you are signed in, and you can close it. The sign-in is kept under `~/.config/runlab/`. `logout` deletes that sign-in. `whoami` prints the email of the signed-in account.

`secret add` and `secret update` prompt with `Value:` when you are at a terminal. If you pipe a value in, the command takes one line. An empty value is refused. `update` replaces the stored value of a name that already exists. `delete` removes the name.

The name has to be a shell variable. It starts with a letter or an underscore, and the rest is letters, digits, and underscores.

The stored value is what a published lab receives, for the account that connected the repository. The catalog sends a lab only the names that lab lists under `env`. If one of those names has no value, the lab does not start. A lab that is already open keeps the values it started with.

On the lab machine, the values are written to `/root/.lab-env` for that run. The disk does not contain them.

`secret add`, `secret update`, and `secret delete` also update `~/.config/runlab/lab-env` for the account that ran `runlabctl`. A local `./trylab` reads that file. If a name is in the file, the lab receives that value. [Commands](trylab.md) shows how to set the variable in the shell instead.

In `config.yaml`, point the lab at the value you saved:

```yaml
env:
  API_TOKEN: $API_TOKEN
```

A value with no leading `$` is stored in the file as plain text. Keep a secret in the `$` form.
