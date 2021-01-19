{ config, pkgs, ... }:

{
  nixpkgs.config.packageOverrides = pkgs: rec {
    scaleway-cli = pkgs.callPackage ./overrides/scaleway-cli.nix {};
  };

  programs.home-manager.enable = true;
  programs.bash = {
    enable = true;
    sessionVariables = {
      DISPLAY = "$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0";
      PS1 = " \\[\\033[1;36m\\]\\u\\[\\033[1;31m\\]@\\[\\033[1;32m\\]\\h:\\[\\033[1;35m\\]\\w\\[\\033[1;31m\\]\\$\\[\\033[0m\\] ";
    };
    shellAliases = {
      ls = "ls --color=auto";
      grep = "grep --color=auto";
      fgrep = "fgrep --color=auto";
      egrep = "egrep --color=auto";
      ll = "ls -l";
    };
  };


  
  programs.dircolors = {
    enable = true;
    enableBashIntegration = true;
  };

  fonts.fontconfig.enable = true;
  
  targets.genericLinux.enable = true;

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    enableNixDirenvIntegration = true;
  };

  programs.git = {
    enable = true;
    userName = "aveltras";
    userEmail = "romain.viallard@outlook.fr";
  };

  home.username = "wsl";
  home.homeDirectory = "/home/wsl";
  
  home.stateVersion = "21.03";

  home.packages = with pkgs; [
    emacs
    fantasque-sans-mono
    jetbrains-mono
    # scaleway-cli
    yadm
    # (import (builtins.fetchTarball https://github.com/hercules-ci/arion/tarball/master) {}).arion
  ];
}
