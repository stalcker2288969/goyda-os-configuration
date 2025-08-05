# ❄️ Goyda Configuration for NixOS

Welcome to my NixOS config!

> ⚠️ **Warning**: It is not finished and may not work!


## 🚀 Installation

To get started with this setup, follow these steps:

1. **Install NixOS**: If you haven't already installed NixOS, follow the [NixOS Installation Guide](https://nixos.org/manual/nixos/stable/#sec-installation) for detailed instructions.
2. **Clone the Repository**:

	```bash
    git clone https://github.com/stalcker2288969/goyda-os-configuration
    cd goyda-os-configuration
    ```

3. **Copy one of the hosts configuration to set up your own**:

    ```bash
    cd hosts
    cp -r goyda-os <your_hostname>
    cd <your_hostname>
    ```

4. **Put your `hardware-configuration.nix` file there**:

    ```bash
    cp /etc/nixos/hardware-configuration.nix ./
    ```

5. **Edit `hosts/<your_hostname>/local-packages.nix` and `nixos/packages.nix` files if needed**:

    ```bash
    nano local-packages.nix
    nano ../../nixos/packages.nix
    ```

6. **Finally, edit `flake.nix` the way you need it or leave it as it is**:

    ```diff
    ...
      outputs = { self, nixpkgs, home-manager, ... }@inputs: let
        system = "x86_64-linux";
    --  homeStateVersion = "25.05";
    ++  homeStateVersion = "<your_home_manager_state_version>";
    --  desctop = "gnome" # hyprland
    ++  desctop = "<your_environment>"
    --  user = "stalcker";
    ++  user = "<your_username>";
        hosts = [
    --    { hostname = "goyda-os"; stateVersion = "25.05"; }
    ++    { hostname = "<your_hostname>"; stateVersion = "<your_state_version>"; }
        ];
    ...
    ```

7. **Rebuilding**:

    ```bash
    cd goyda-os-configuration
    git add .
    nixos-rebuild switch --flake ./#<hostname>
    # or nixos-install --flake ./#<hostname> if you are installing on a fresh system
    home-manager switch
    ```

