{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    gcc
    firefox
    flatpak
    gnome-software
    #vscode
    # kdenlive
    # jetbrains.pycharm-professional
    # jetbrains.rider 
    # jre8
    # qemu
    # quickemu
  ];
}
