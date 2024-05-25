{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./modules/audio.nix
    ./modules/bootloader.nix
    ./modules/display.nix
    ./modules/nas-mounts.nix
    ./modules/tailscale.nix
    ./modules/users.nix
    # TODO make load per hostname
    ./modules/machine-specific/ratatootie.nix
  ];

  networking.networkmanager.enable = true;
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "23.11";
}
