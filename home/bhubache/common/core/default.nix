{ config, pkgs, inputs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "bhubache";
  home.homeDirectory = "/home/bhubache";

  imports = [
    ./neovim/default.nix
    ./bat.nix
    ./btop.nix
    ./eza.nix
    ./wofi.nix
    ./ghostty/default.nix
    ./lazygit.nix
    ./waybar
    ./zsh.nix
    ./starship.nix
    ./yazi.nix
    ./zellij
    ./diff-so-fancy.nix
    inputs.xremap-flake.homeManagerModules.default
  ];

  services.xremap = {
    enable = true;
    withWlroots = true;
    config = {
      modmap = [
        {
	  name = "Caps lock to Left Control/Escape";
	  remap = {
	    CapsLock = {
	      held = "Ctrl_L";
	      alone = "Esc";
	      alone_timeout_millis = 500;
	    };
	  };
	}
      ];
    };
  };

  wayland.windowManager.sway = {
    enable = true;
    # TODO: set to ``true`` upon resolution of https://github.com/nix-community/home-manager/issues/5379
    checkConfig = false;
    package = pkgs.swayfx;
    config = {
      terminal = "ghostty";
      bars = [{ command = "waybar"; }];
      window.border = 0;
      window.titlebar = false;
      menu = "wofi --show=run";
    };
    extraConfigEarly = ''
      output DP-2 mode 1920x1080@239.760Hz pos 0 0
      output DP-3 mode 1920x1080@239.760Hz pos 1920 0
      output DP-1 mode 1920x1080@239.760Hz pos 3840 0

      workspace 1 output DP-2
      workspace 2 output DP-3
      workspace 3 output DP-1

      input type:pointer {
        accel_profile "flat"
        pointer_accel 0.2
      }
    '';
    extraConfig = ''
      blur enable
      layer_effects "waybar" blur enable
    '';
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  fonts.fontconfig.enable = true;
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.ripgrep
    pkgs.wl-clipboard
    pkgs.pre-commit
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/bhubache/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
