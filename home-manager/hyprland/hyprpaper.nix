{ pkgs, config, ... }:

let
  wallpaperPath = "${config.home.homeDirectory}/.local/share/wallpapers/wallpaper.png";
in {
  
  home.packages = with pkgs; [
    hyprpaper
  ];
 
  home.file.".local/share/wallpapers/wallpaper.png".source =
    ../../assets/wallpapers/wallpaper.png;

  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ${wallpaperPath}
    wallpaper = ,${wallpaperPath}
  '';
}

