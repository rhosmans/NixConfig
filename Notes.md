# Notes

## Useful Terminal Commands

### Create Symbolic Link

`sudo ln -s /path/to/real/file /path/to/sym/file`

### Clean NixOS Generations

- `sudo nix-env --list-generations --profile /nix/var/nix/profiles/system` to see current build generations
- `sudo nix-env --delete-generations old --profile /nix/var/nix/profiles/system` to delete old builds
- `nix-collect-garbage -d` to clean builds from FS
- `sudo nixos-rebuild boot --flake /etc/nixos#highpointe` to rebuild and update grub menu to remove old options

## Reference declarations

### GTK

``` #bash
gtk = {
      enable = true;
      font.name = "TeX Gyre Adventor 10";
      theme = {
        name = "Juno";
        package = pkgs.juno-theme;
      };
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };

      gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

      gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
    
  };
```
