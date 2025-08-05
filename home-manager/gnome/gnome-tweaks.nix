{pkgs, ...}:
{
    home.packages = with pkgs; [
        gnome-tweaks
    ];
}