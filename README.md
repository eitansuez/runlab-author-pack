# runlab author pack

This pack lets you build, develop, and test labs on your own machine. When a lab is ready, you publish it at runlabs.io.

It runs on Linux x86_64 with KVM.

Download the latest release and unpack it. The archive contains `trylab`, `runlabctl`, `packer`, and the instructions.

https://github.com/eitansuez/runlab-author-pack/releases/latest

## runlab docs

The author manual. The short guide that ships in the author pack stays in that pack.

```
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

This directory has a direnv `.envrc`. Entering it activates `.venv`. Then:

```
zensical serve
```

The preview listens on http://localhost:8000. `zensical build` writes the site into `site/`.
