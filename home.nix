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
            obsidian            # Notes
            zsh	        	    # FuckBash
            oh-my-zsh	    	# ifykyk
            alacritty		    # Terminal
            vscode			    # WorkShenanigans
            rofi-wayland 		# AppLauncher
            yazi			    # TerminalFileManager
            xfce.tumbler		# FileManagerThumbnails
            ffmpegthumbnailer	# VideoThumbnails
            swww			    # WallpaperDaemon
            xfce.thunar         # GUIFileManager	
            rose-pine-hyprcursor
            calcure
            slack
            jq
            followLink
            # hyperpanel deps
            adwaita-icon-theme
            # lazyVim deps
            ripgrep
            fd
            gcc
            unzip
            lazygit
            tree-sitter
            nodejs
            python3
    ];

      gtk = {
        enable = true;
        theme = {
        name = "Adwaita-dark";
        package = pkgs.gnome-themes-extra;
        };
            gtk3.extraConfig = {
            gtk-application-prefer-dark-theme = true;
        };
         gtk4.extraConfig = {
            gtk-application-prefer-dark-theme = true;
        };
    };

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
        # hyprpanel = {
        #     enable = true;
        #     settings = {
        #         bar.launcher.autoDetectIcon = true;
        #         bar.workspaces.show_icons = true;
        #         menus.clock = {
        #             time = {
        #                 hideSeconds = true;
        #             };
        #         };
        #         theme.bar.transparent = true;
        #     };
        # };
        alacritty = {
            enable = true;
            settings = {
                window = {
                    opacity = 0.8;
                    blur = true;
                };
                font.size = 20;
                selection.save_to_clipboard = true;
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
