{ pkgs, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true; # Запуск Hyprland через systemd — желательно

    settings = {
      env = [
        # Electron, Qt и другие приложения на Wayland
        "NIXOS_OZONE_WL,1"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "QT_QPA_PLATFORM,wayland"
        "XDG_SCREENSHOTS_DIR,$HOME/Pictures/Screenshots"
        "XCURSOR_THEME,Catppuccin-Mocha-Dark-Cursors"
        "XCURSOR_SIZE,24"
      ];

      monitor = [
        "HDMI-A-2, 1920x1080, 0x0, 1"
        "HDMI-A-1, 1920x1080, 1920x0, 1"
      ];
      
      "$mainMod" = "SUPER";
      "$terminal" = "kitty";
      "$fileManager" = "nautilus";
      "$menu" = "wofi --show drun";
      "$editor" = "code";
      "$browser" = "firefox";
      exec-once = [
        "waybar"
        "nm-applet"
        "kitty"
        "hyprpaper"
        #"swaybg -i ~/wallpapers/wallpaper.jpg" # если есть обои
      ];

      input = {
        kb_layout = "us,ru";
        kb_options = "grp:alt_shift_toggle";
        follow_mouse = 1;
        natural_scroll = false;
        touchpad = {
          disable_while_typing = true;
          tap-to-click = true;
          natural_scroll = true;
        };
      };

      bind = [
        "$mainMod, Q, exec, $terminal"
        "$mainMod, T, exec, $fileManager"
        #"$mainMod, R, exec, $menu"
        "$mainMod, TAB, exec, $menu"
        "$mainMod, E, exec, $editor"
        "$mainMod SHIFT, R, exec, pkill waybar && waybar"
        "$mainMod, C, killactive"
        "$mainMod, F, fullscreen"
        "$mainMod, V, togglefloating"
        "$mainMod, Return, exec, $terminal"
        "$mainMod, M, exit"
        "$mainMod, B, exec, $browser"
        "$mainMod, P, pseudo" #dwindle
        "$mainMod, J, togglesplit" #dwindle
        "$mainMod SHIFT, L, exec, hyprlock"

        #Picker
        "$mainMod SHIFT, P, exec, hyprpicker"
        #Screenshots
        "$mainMod, S, exec, grim ~/Pictures/screenshot-$(date +%Y-%m-%d_%H-%M-%S).png"
        "$mainMod SHIFT, S, exec, grim -g \"$(slurp)\" ~/Pictures/screenshot-$(date +%Y-%m-%d_%H-%M-%S).png"

        # Moving focus
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Moving windows
        "$mainMod SHIFT, left,  swapwindow, l"
        "$mainMod SHIFT, right, swapwindow, r"
        "$mainMod SHIFT, up,    swapwindow, u"
        "$mainMod SHIFT, down,  swapwindow, d"

        # Resizeing windows                   X  Y
        "$mainMod CTRL, left,  resizeactive, -60 0"
        "$mainMod CTRL, right, resizeactive,  60 0"
        "$mainMod CTRL, up,    resizeactive,  0 -60"
        "$mainMod CTRL, down,  resizeactive,  0  60"

        # Switching workspaces
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Moving windows to workspaces
        "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
        "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
        "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
        "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
        "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
        "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
        "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
        "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
        "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
        "$mainMod SHIFT, 0, movetoworkspacesilent, 10"

        # Scratchpad
        "$mainMod,       A, togglespecialworkspace,  magic"
        "$mainMod SHIFT, A, movetoworkspace, special:magic"

      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;

        resize_on_border = true;
        allow_tearing = false;
        #col.active_border = "rgba(5e81acff) rgba(88c0d0ff) 45deg";
        #col.inactive_border = "rgba(3b4252aa)";
        layout = "master";
      };
      
      #dwindle = {
      #  pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
      #  preserve_split = true; # You probably want this
      #};

      # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
      #master = {
      #    new_status = "master";
      #};

      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };
      decoration = {
        rounding = 8;
        
        blur = {
          enabled = true;
          size = 6;
          passes = 3;
        };

        active_opacity = 1.0;
        inactive_opacity = 0.8;
        
        shadow = {
            enabled = true;
            range = 4;
            render_power = 3;
            color = "rgba(1a1a1aee)";
        };

        #shadow = {
        #  enabled = false;
        #};
      };
      
      windowrule = [
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
        "suppressevent maximize, class:.*"
        "float, class:(kvantummanager|qt5ct|qt6ct|blueman-manager)"
      ];

      windowrulev2 = [
        "float, class:^(kitty)$"
        "center, class:^(kitty)$"
        "float, class:^(imv)$"
        "opacity 0.8, class:^(org\\.gnome\\.Nautilus)$"
      ];
    };
  };
}
