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
    ./modules/thunar.nix
    ./modules/users.nix
    # TODO make load per hostname
    ./modules/machine-specific/ratatootie.nix
  ];

  networking.networkmanager.enable = true;
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "23.11";

  # Irritating bug: https://github.com/NixOS/nixpkgs/issues/143365
  security.pam.services.swaylock.text = ''
    # Account management.
    account required pam_unix.so

    # Authentication management.
    auth sufficient pam_unix.so   likeauth try_first_pass
    auth required pam_deny.so

    # Password management.
    password sufficient pam_unix.so nullok sha512

    # Session management.
    session required pam_env.so conffile=/etc/pam/environment readenv=0
    session required pam_unix.so
  '';
}
