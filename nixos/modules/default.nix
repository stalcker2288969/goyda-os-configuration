{desctop, ...}:
{
  imports = [
    ./audio.nix
    ./boot.nix
    ./home-manager.nix
    ./kernel.nix
    ./networking.nix
    ./nix.nix
    ./timezone.nix
    ./zram.nix
    ./bluetooth.nix
    ./i18n.nix
    ./libinput.nix
    ./nh.nix
    ./printing.nix
    ./user.nix
    ./desctop/${desctop}.nix
  ];
}