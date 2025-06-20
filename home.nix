{ config, pkgs, lib, ... }:
{
    home.username = "reave";
    home.stateVersion = "25.05";

    home.packages = [
        	pkgs.pipewire
        	pkgs.meson
        	pkgs.ninja
        	pkgs.dunst
        	pkgs.libnotify
		    pkgs.wget
        	pkgs.htop
		    pkgs.zoxide
        	pkgs.obsidian           # Notes
        	pkgs.zsh	        	# FuckBash
        	pkgs.oh-my-zsh	    	# ifykyk
        	pkgs.alacritty		    # Terminal
		    pkgs.vscode			    # WorkShenanigans
        	pkgs.firefox			# InternetBrowser
        	pkgs.rofi-wayland 		# AppLauncher
        	pkgs.yazi			    # TerminalFileManager
        	pkgs.xfce.tumbler		# FileManagerThumbnails
        	pkgs.ffmpegthumbnailer	# VideoThumbnails
        	pkgs.swww			    # WallpaperDaemon
        	pkgs.xfce.thunar        # GUIFileManager	
            # hyperpanel deps
            pkgs.adwaita-icon-theme
    ];


    programs = {
        zen-browser = {
            enable = true;
            # nativeMessagingHosts = [pkgs.firefoxpwa];
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
        hyprpanel = {
            enable = true;
            settings = {
                bar.launcher.autoDetectIcon = true;
                bar.workspaces.show_icons = true;
                menus.clock = {
                    time = {
                        hideSeconds = true;
                    };
                };
                theme.bar.transparent = true;
            };
        };
        alacritty = {
            enable = true;
            settings = {
                window = {
                    opacity = 0.6;
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
        neovim.enable = true;
        firefox.enable = true;
    };

    home.file."/home/reave/.config/hypr/hyprland.conf" = {
        source = ./hyprland/hyprland.conf;
        force = true;
    };

    # home.file."path/to/firefox-default/profile/chrome" = {
    #   source = ./Firefox/;
    #   force = true;     
    # };
}
