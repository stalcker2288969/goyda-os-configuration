{ homeStateVersion, user, desctop, ... }: {
  imports = [
    ./modules
    ./home-packages.nix
    ./${desctop}
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;
  };
}