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
        	pkgs.yazi			    #TerminalFileManager
        	pkgs.xfce.tumbler		#FileManagerThumbnails
        	pkgs.ffmpegthumbnailer	#VideoThumbnails
        	pkgs.gvfs			    #TrashSupport
        	pkgs.swww			    #WallpaperDaemon
        	pkgs.thunar	    		    #GUIFileManager	
        #   ladybird	    	    #Browser
        #	hyprpanel		        #Statusbar
    ];

    programs = {
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
        alacritty = {
            enable = true;	
            settings ={
                font.size = 12;
                shell.program = "/usr/local/bin/zsh";
            };	
        };
        neovim.enable = true;
        xfconf.enable = true;
        firefox.enable = true;
    };
}