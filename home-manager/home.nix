{ homeStateVersion, user, desktop, ... }: {
  imports = [
    ./modules
    ./home-packages.nix
    ./${desktop}/main.nix
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;
  };
}