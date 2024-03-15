{
  pkgs,
  lib,
  ...
}: let
  # sorry
  sources = import ../nix/sources.nix;
  lanzaboote = import sources.lanzaboote;
in {
  imports = [lanzaboote.nixosModules.lanzaboote];

  environment.systemPackages = [
    # For debugging and troubleshooting Secure Boot.
    pkgs.sbctl
  ];
  # Force systemd-boot to false just in case it accidentally gets set to true
  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/etc/secureboot";
  };
}
