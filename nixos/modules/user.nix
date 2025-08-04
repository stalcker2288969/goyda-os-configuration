{pkgs,user,...}: {

    programs.fish.enable = true; 

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users = {
        defaultUserShell = pkgs.fish;
        users.${user} = {
        isNormalUser = true;
        description = "goyda-os user";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [
            #  thunderbird
            ];
        };
    };

    services.getty.autologinUser = user;
}