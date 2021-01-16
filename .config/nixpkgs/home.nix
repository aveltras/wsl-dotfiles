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
    };
    shellAliases = {
      ll = "ls -l";
    };
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

  home.username = "romain";
  home.homeDirectory = "/home/romain";
  
  home.stateVersion = "21.03";

  home.packages = with pkgs; [
    emacs
    jetbrains-mono
    # scaleway-cli
    yadm
    (import (builtins.fetchTarball https://github.com/hercules-ci/arion/tarball/master) {}).arion
  ];
}
