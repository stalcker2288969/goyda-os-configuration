{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    gcc
    firefox
    #vscode
    # kdenlive
    # jetbrains.pycharm-professional
    # jetbrains.rider 
    # jre8
    # qemu
    # quickemu
  ];
}
