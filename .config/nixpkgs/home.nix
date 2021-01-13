{ config, pkgs, ... }:

{
  nixpkgs.config.packageOverrides = pkgs: rec {
    scaleway-cli = pkgs.callPackage ./overrides/scaleway-cli.nix {};
  };

  programs.home-manager.enable = true;
  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
    };
  };

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
    # scaleway-cli
    yadm
  ];
}
