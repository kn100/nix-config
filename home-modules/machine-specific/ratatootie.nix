{...}: {
  wayland.windowManager.hyprland.settings = {
    monitor = [
      "DP-1,3840x2160@60,0x0,1.25,transform,1" # The LG monitor (portrait)
      # So it turns out the position (third arg), is based on the scaled resolution for
      # some inexplicable reason. I didn't know that at the time, so I just determined
      # this position experimentally. Dumb dumb dumb.
      "DP-2,3840x2160@143.85699,1726x780,1.25" # The Samsung (landscape, to right of LG)
    ];
  };
}
