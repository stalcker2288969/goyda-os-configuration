{ pkgs, ... }: {
    programs.waybar = {
        enable = true;
        package = pkgs.waybar;
    };

    xdg.configFile."waybar/config".text = ''
    {
    "layer": "top",
    "position": "top",
    "margin-top": 0,

    "modules-left": [ "hyprland/workspaces", "wlr/taskbar" ],
    "modules-center": [ "mpris" ],
    "modules-right": [
        "pulseaudio",
        "cpu",
        "network",
        "bluetooth",
        "hyprland/language",
        "clock"
    ],

    "hyprland/workspaces": {
        "format": "{icon}",
        "on-click": "activate"
    },

    "wlr/taskbar": {
        "format": "{icon}",
        "on-click": "activate",
        "icon-size": 18,
        "icon-theme": "Papirus-Dark",
        "tooltip-format": "{title}"
    },

    "mpris": {
        "format": "󰎈 {title} 󰍛 {artist}",
        "format-paused": " {title} 󰍛 {artist}",
        "format-stopped": "󰝚 Stopped"
    },

    "pulseaudio": {
        "format": "󰕾 {volume}%",
        "format-muted": "󰝟 muted"
    },

    "cpu": {
        "format": "󰍛 {usage}%"
    },

    "network": {
        "format-wifi": "󰤨 {essid}",
        "format-ethernet": "󰈁 {ifname}",
        "format-disconnected": "󰤮"
    },

    "bluetooth": {
        "format": "󰂯 {status}",
        "format-disabled": "󰂲 Off"
    },

    "clock": {
        "format": "󰥔 {:%H:%M  %d.%m.%Y}"
    }
    }
    '';

    xdg.configFile."waybar/style.css".text = ''
    * {
        border: none;
        border-radius: 12px;
        padding: 0 10px;
        margin: 0 6px;
        font-family: "JetBrainsMono Nerd Font", "Font Awesome", "Noto Color Emoji", sans-serif;
        font-size: 13px;
        min-height: 0;
    }

    window#waybar {
        background-color: rgba(30, 30, 46, 0.95); /* mocha.base */
        color: #cdd6f4; /* mocha.text */
        margin: 6px 8px 0 8px;
        border-radius: 10px;
        border: 1px solid #6c7086; /* mocha.surface2 */
    }

    #workspaces button {
        padding: 0 8px;
        border-radius: 8px;
        margin: 0 4px;
        background: transparent;
        color: #cdd6f4;
        transition: background 0.2s;
    }

    #workspaces button.active {
        background-color: #89b4fa; /* mocha.blue */
        color: #1e1e2e; /* mocha.base (dark text) */
    }

    #taskbar button {
        background: transparent;
        padding: 0 6px;
        border-radius: 6px;
        margin: 0 4px;
    }

    #taskbar button:hover {
        background-color: #45475a; /* mocha.surface1 */
    }

    #taskbar button.active {
        background-color: #f38ba8; /* mocha.red */
        color: #1e1e2e;
    }

    #pulseaudio, #cpu, #network, #bluetooth, #clock, #mpris {
        padding: 0 10px;
    }
    '';

}
