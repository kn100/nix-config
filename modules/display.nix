{
  config,
  pkgs,
  ...
}: {
  services.xserver.enable = true;
  # Login manager
  # TODO: Figure out how to control which display it spawns on.
  services.xserver.displayManager.sddm.enable = true;
  programs.hyprland.enable = true;
  services.xserver.displayManager.defaultSession = "hyprland";

  # GTK themes not applied in wayland applications/Window Decorations missing
  programs.dconf.enable = true;

  # Ask electron apps to not be shit and use Wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # File dialogs
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

  # Fonts
  fonts.packages = with pkgs; [
    font-awesome
    powerline-fonts
    powerline-symbols
    (nerdfonts.override {fonts = ["NerdFontsSymbolsOnly"];})
  ];
}
