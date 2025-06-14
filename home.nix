{ config, pkgs, ... }:
{
    home.username = "_reave";
    home.homeDirectory = "/home/_reave";

    home.stateVersion = "25.05";

    home.packages = [
        	pkgs.pipewire
        	pkgs.meson
        	pkgs.ninja
        	pkgs.dunst
        	pkgs.libnotify
            pkgs.wget
        	pkgs.git
        	pkgs.htop
            pkgs.zoxide
        	pkgs.obsidian            #Notes
        	pkgs.zsh	        		#FuckBash
        	pkgs.oh-my-zsh	    	#ifykyk
        	pkgs.alacritty		    #Terminal
        	pkgs.neovim 			    #TextEditor
        	pkgs.vscode			    #WorkShenanigans
        	pkgs.firefox			    #InternetBrowser
        	pkgs.rofi-wayland 		#AppLauncher
        	pkgs.wl-clipboard		#ClipboardFunctionality
        	pkgs.hyprland		    #TilingWindowManager
        	pkgs.yazi			    #TerminalFileManager
        	pkgs.xfce.tumbler		#FileManagerThumbnails
        	pkgs.ffmpegthumbnailer	#VideoThumbnails
        	pkgs.gvfs			    #TrashSupport
        	pkgs.swww			    #WallpaperDaemon
        #   ladybird		    #Browser
        #	hyprpanel		    #Statusbar
        #	thunar			    #GUIFileManager	
    ];

    programs = {
        hyprland = {
            enable = true;
            xwayland.enable = true;
        };
        alacritty.enable = true;
        zsh = {
            enable = true;
            enableCompletion = true;
            enableBashCompletion = true;
            autosuggestions.enable = true;
            syntaxHighlighting.enable = true;
            histSize = 1000;
            ohMyZsh = {
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
    };
}