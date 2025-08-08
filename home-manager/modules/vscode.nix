{ pkgs, ... }:

{
    home.packages = with pkgs; [
        pkgs.vscode
    ];

    programs.vscode.profiles.default = {
        extensions = with pkgs.vscode-extensions; [
            catppuccin-vsc
            catppuccin-vsc-icons
        ];
    };
}
