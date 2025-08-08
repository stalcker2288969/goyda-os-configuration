{ config, pkgs, ... }: {
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    hyprland
    waybar
    kitty
    nautilus
    rofi-wayland
    wl-clipboard
    grim
    slurp
    swaybg
    dunst
    libsForQt5.xwaylandvideobridge
    libnotify
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
  ];

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # Важно: SDDM должен быть настроен на запуск Hyprland
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  # Обязателен для Wayland + Hyprland
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  # Включение аппаратного ускорения (если доступно)
  hardware.opengl = {
    enable = true;
  };
}
