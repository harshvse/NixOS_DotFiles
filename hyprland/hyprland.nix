{config, lib, pkgs, ...}:

{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      # Your Hyprland config here
      monitor=,preferred,auto,auto

      # Example keybindings
      bind=SUPER,RETURN,exec,kitty
      bind=SUPER,Q,killactive,
      bind=SUPER,M,exit,
      bind=SUPER,E,exec,dolphin
      bind=SUPER,V,togglefloating,
      bind=SUPER,R,exec,wofi --show drun
      bind=SUPER,P,pseudo,
      bind=SUPER,W,exec,google-chrome-stable

      # Example window rules
      windowrule=float,^(kitty)$
      windowrule=float,^(pavucontrol)$
    '';
  };

  # You might want to add some programs that work well with Hyprland
  home.packages = with pkgs; [
    wofi  # Application launcher
    waybar  # Status bar
    swaylock  # Screen locker
    swayidle  # Idle management daemon
    grim  # Screenshot utility
    slurp  # Region selection tool
    mako  # Notification daemon
    kitty
  ];
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    bind =
      [
        ", Print, exec, grimblast copy area"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
        builtins.concatLists (builtins.genList (i:
            let ws = i + 1;
            in [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          )
          9)
      );
  };
}
