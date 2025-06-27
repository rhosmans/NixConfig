{ config, pkgs, lib, followLink, nvim, ... }:

{
    home.username = "reave";
    home.stateVersion = "25.05";
      
    home.packages = with pkgs; [
            pipewire
            meson
            ninja
            dunst
            libnotify
            wget
            htop
            zoxide
            obsidian                # Notes
            zsh	        	        # FuckBash
            oh-my-zsh	    	    # ifykyk
            alacritty		        # Terminal
            vscode			        # WorkShenanigans
            rofi-wayland 		    # AppLauncher
            yazi			        # TerminalFileManager
            xfce.tumbler		    # FileManagerThumbnails
            ffmpegthumbnailer	    # VideoThumbnails
            swww			        # WallpaperDaemon
            calcure
            slack
            jq
            followLink
            # lazyVim deps
            ripgrep
            fd
            gcc
            unzip
            lazygit
            tree-sitter
            nodejs
            python3
            # Rice
            rose-pine-hyprcursor
            tokyonight-gtk-theme
            zafiro-icons
            nordic
            yaziPlugins.nord
            alacritty-theme
            # Dolphin deps
            kdePackages.dolphin     # GUIFileManager
            kdePackages.qtsvg       # Dolphin svgIcons
            kdePackages.kio-fuse    # to mount remote filesystems via FUSE
            kdePackages.kio-extras  # extra protocols support (sftp, fish and more)
    ];

    xdg.mimeApps = {
        enable = true;
        defaultApplications = {
            "x-scheme-handler/http" = "link-handler.desktop";
            "x-scheme-handler/https" = "link-handler.desktop";
        };
    };

    xdg.desktopEntries."link-handler" = {
        name = "Link Handler";
        exec = "link-handler %u";
        mimeType = [ "x-scheme-handler/http" "x-scheme-handler/https" ];
        terminal = false;
        type = "Application";
    };

    stylix = {
        enable = true;
        base16Scheme = "${./themes/nord-alt.yaml}";
        polarity = "dark";
        # overlays.enable = true;
        # targets.alacritty.enable = false;
        opacity = {
            terminal = 0.9;
            desktop = 0.9;
        }; 
        fonts = {
            sizes = {
                applications = 16;
                terminal = 16;
                popups = 20;
                desktop = 12;
            };
            serif = {
                package = pkgs.nerd-fonts.mononoki;
                name = "Mononoki Nerd Font";
                # package = pkgs.nerd-fonts.overpass;
                # name = "Overpass Nerd Font";
            };
            sansSerif = {
                package = pkgs.nerd-fonts.overpass;
                name = "Overpass Nerd Font";
            };
            monospace = {
                package = pkgs.nerd-fonts.liberation;
                name = "LiterationMono Nerd Font Mono";
            };
            emoji = {
                package = pkgs.noto-fonts-emoji;
                name = "Noto Color Emoji";
            };
        };

    };

    programs = {
        neovim = {
            enable = true;
            viAlias = true;
            vimAlias = true;
        };
        zen-browser = {
            enable = true;
        };
        git = {
            enable = true;
            userName = "rhosmans";
            userEmail = "rhosmans@gmail.com";
            extraConfig = {
                init.defaultBranch = "main";
            };
        };
        zsh = {
            enable = true;
            enableCompletion = true;
            enableAutosuggestions = true;
            enableSyntaxHighlighting = true;
            history = {
                size = 10000;
                save = 10000;
                ignoreDups = true;
            };
            oh-my-zsh = {
                enable = true;
                theme = "crunch";
                plugins = [
                    "kubectl"
                    "git"
                    "helm"
                    "docker"
                    "git"
                    "sudo"
                    "cp"
                    "dotenv"
                    "gcloud"
                    "golang"
                    "postgres"
                    "yarn"
                ];
            };
        };
        alacritty = {
            enable = true;
            settings = {
                window = {
                    blur = true;
                    dynamic_padding = true;
                    padding = {
                        x = 5;
                        y = 2;
                    };
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
    };

    home.file.".config/nvim".source = nvim;


    home.file."/home/reave/.config/hypr/hyprland.conf" = {
        source = ./hyprland/hyprland.conf;
        force = true;
    };

    home.file.".icons/rose-pine".source = "${pkgs.rose-pine-hyprcursor}/share/icons/rose-pine";
}
