{...}: {
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    exec-once = [
      "swww init"
      # TODO this may not be present. Make it so.
      "swww img /home/kn100/Pictures/wp.png"
      "nm-applet --indicator"
      "waybar"
    ];
    binde = [
      ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-"
    ];
    bindm = ["$mod,mouse:272,movewindow" "$mod,mouse:273,resizewindow"];
    bind =
      [
        "$mod, K, exec, kitty"
        "$mod, F, exec, firefox"
        "$mod, Space, exec, wofi --show drun --normal window"
        "$mod, Q, killactive"
        "$mod, L, exec, swaylock --show-keyboard-layout --indicator-caps-lock --color 000000"
        ", Print, exec, grimblast copy area"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList (x: let
            ws = let c = (x + 1) / 10; in builtins.toString (x + 1 - (c * 10));
          in [
            "$mod, ${ws}, workspace, ${toString (x + 1)}"
            "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
          ])
          10)
      );
  };
}
