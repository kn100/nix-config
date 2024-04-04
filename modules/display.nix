{
  config,
  pkgs,
  ...
}: {
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  environment.systemPackages = with pkgs; [gnomeExtensions.appindicator gnome.adwaita-icon-theme];
  services.udev.packages = with pkgs; [gnome.gnome-settings-daemon];
  # GTK themes not applied in wayland applications/Window Decorations missing
  programs.dconf.enable = true;

  # Ask electron apps to not be shit and use Wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Fonts
  fonts.packages = with pkgs; [
    font-awesome
    powerline-fonts
    powerline-symbols
    (nerdfonts.override {fonts = ["NerdFontsSymbolsOnly"];})
  ];
}
