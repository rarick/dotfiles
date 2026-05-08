# dotfiles

Portable shell development environment managed with [Nix](https://nixos.org/) and [Home Manager](https://github.com/nix-community/home-manager).

## Bootstrap

1. Install Nix:

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

2. Clone this repo:

```bash
git clone <repo-url> ~/.dotfiles
cd ~/.dotfiles
```

3. Apply the configuration:

```bash
nix run home-manager -- --flake . switch --impure
```

## Updating

After making changes, re-run:

```bash
nix run home-manager -- --flake . switch --impure
```

To update nix dependencies:

```bash
nix flake update
```

## Notes

- Git identity is not set here — create `~/.gitconfig-local` on each machine with your name/email.
- Fish plugins are managed via nix (not fisher). The `conf.d/nix-plugins.fish` script sources them from the nix profile.
