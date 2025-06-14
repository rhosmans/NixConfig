{ config, pkgs, ... }:
{
    home.username = "_reave";
    home.homeDirectory = "/home/_reave";

    home.stateVersion = "25.05";

    home.packages = [
        	pipewire
        	meson
        	ninja
        	dunst
        	libnotify
            wget
        	git
        	htop
            zoxide
        	obsidian            #Notes
        	zsh	        		#FuckBash
        	oh-my-zsh	    	#ifykyk
        	alacritty		    #Terminal
        	neovim 			    #TextEditor
        	vscode			    #WorkShenanigans
        	firefox			    #InternetBrowser
        	rofi-wayland 		#AppLauncher
        	wl-clipboard		#ClipboardFunctionality
        	hyprland		    #TilingWindowManager
        	yazi			    #TerminalFileManager
        	xfce.tumbler		#FileManagerThumbnails
        	ffmpegthumbnailer	#VideoThumbnails
        	gvfs			    #TrashSupport
        	swww			    #WallpaperDaemon
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