# Notes

## Useful Terminal Commands

### Create Symbolic Link

`sudo ln -s /path/to/real/file /path/to/sym/file`

### Clean NixOS Generations

- `nix-env --list-generations` to see current build generations

- `nix-collect-garbage -d` to clean builds

- `sudo nixos-rebuild switch --flake /etc/nixos#highpointe` to rebuild and update grub menu to remove old options
