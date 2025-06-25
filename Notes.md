# Notes

## Useful Terminal Commands

### Create Symbolic Link

`sudo ln -s /path/to/real/file /path/to/sym/file`

### Clean NixOS Generations

- `sudo nix-env --list-generations --profile /nix/var/nix/profiles/system` to see current build generations
- `sudo nix-env --delete-generations old --profile /nix/var/nix/profiles/system` to delete old builds
- `nix-collect-garbage -d` to clean builds from FS
- `sudo nixos-rebuild switch --flake /etc/nixos#highpointe` to rebuild and update grub menu to remove old options
