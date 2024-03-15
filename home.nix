{
  config,
  pkgs,
  ...
}: {
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
  home.username = "kn100";
  home.homeDirectory = "/home/kn100";

  home.packages = with pkgs; [
    cowsay
    neofetch
    zip
    xz
    unzip
    p7zip
    tree
    which
    zstd
    lm_sensors
    pkgs.vscode.fhs
    firefox
    bitwarden
    telegram-desktop
    kitty
    easyeffects
    curl
    pkgs.waybar
    pkgs.dunst
    libnotify
    swww
    wofi
    orchis-theme
    gnome.file-roller
    htop
  ];

  imports = [
    ./home-modules/git.nix
    ./home-modules/theming.nix
    ./home-modules/hyprland.nix
    # TODO make this load based on hostname
    ./home-modules/machine-specific/ratatootie.nix
  ];
}
