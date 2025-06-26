# Notes

## Useful Terminal Commands

### Create Symbolic Link

`sudo ln -s /path/to/real/file /path/to/sym/file`

### Clean NixOS Generations

- `sudo nix-env --list-generations --profile /nix/var/nix/profiles/system` to see current build generations
- `sudo nix-env --delete-generations old --profile /nix/var/nix/profiles/system` to delete old builds
- `nix-collect-garbage -d` to clean builds from FS
- `sudo nixos-rebuild boot --flake /etc/nixos#highpointe` to rebuild and update grub menu to remove old options

- `ls $(nix eval --raw nixpkgs#<package-name>)/share` browse files included in nix.pkgs.
  - ex. `ls $(nix eval --raw nixpkgs#zafiro-icons)/share/icons` to get icon theme names.

- `nix flake show github:<repo-link>` to show attributes provided by nix flake.

## Reference declarations

### Hyprland

Specify keybinds and hyprland settings in Home.nix

```#nixos
  wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        bind = [
          "SUPER,Q,exec,kitty"
          "SUPER, X, exec, firefox"
          "ALT, Tab, cyclenext"
          "ALT, Tab, bringactivetotop"
          "SUPER, T, togglefloating"
          "SUPER, W, closewindow"
          "SUPER, F, fullscreen"
        ];
        bindm = [
          "SUPER_SHIFT, mouse:272, resizewindow"
          "SUPER, mouse:272, movewindow"
        ];
      };
    };
```

### GTK

``` #zsh
    gtk = {
        enable = true;
        font.name = "Overpass Nerd Font";
        theme = {
            name = "Tokyonight-Dark";
            package = pkgs.tokyonight-gtk-theme;
        };
        iconTheme = {
            name = "Nordic-darker";
            package = pkgs.nordic;
        };
        gtk3.extraConfig = {
            gtk-application-prefer-dark-theme = true;
        };
        gtk4.extraConfig = {
            gtk-application-prefer-dark-theme = true;
        };
    };
```

### Alacritty config

``` #zsh
alacritty = {
            enable = true;
            settings = {
                colors = {
                    primary = {
                        # background = "#2E3440";
                        foreground = "#D8DEE9";
                        background = "#1E2129";
                        # foreground = "#2E3440";
                    };
                    normal = {
                        black   = "#3B4252";
                        red     = "#BF616A";
                        green   = "#A3BE8C";
                        yellow  = "#EBCB8B";
                        blue    = "#81A1C1";
                        magenta = "#B48EAD";
                        cyan    = "#88C0D0";
                        white   = "#E5E9F0";
                    };
                    bright = {
                        black   = "#4C566A";
                        red     = "#BF616A";
                        green   = "#A3BE8C";
                        yellow  = "#EBCB8B";
                        blue    = "#81A1C1";
                        magenta = "#B48EAD";
                        cyan    = "#8FBCBB";
                        white   = "#ECEFF4";
                    };
                };
                window = {
                    opacity = 0.9;
                    blur = true;
                    dynamic_padding = true;
                    padding = {
                        x = 5;
                        y = 2;
                    };
                };
                font = {
                    normal = {
                        family = "CaskaydiaMono Nerd Font Mono";
                        style = "Regular";
                    };
                    bold = {
                        family = "CaskaydiaMono Nerd Font Mono";
                        style = "Bold";
                    };
                    italic = {
                        family = "CaskaydiaMono Nerd Font Mono";
                        style = "Italic";
                    };
                    size = 16;
                };
                selection.save_to_clipboard = false;
                cursor.thickness = 0.20;
                cursor.unfocused_hollow = false;
                cursor.style.shape = "Beam";
                cursor.style.blinking = "On";
                keyboard.bindings = [
                    # { key = ""; mods = "Command" | "Control" | "Option" | "Super" | "Shift" | "Alt"; action = ""; }
                    { key = "C"; mods = "Alt"; action = "Copy"; }
                    { key = "V"; mods = "Alt"; action = "Paste"; }
                    { key = "="; mods = "Alt"; action = "IncreaseFontSize"; }
                    { key = "-"; mods = "Alt"; action = "DecreaseFontSize"; }
                ];
            };
        };
```
