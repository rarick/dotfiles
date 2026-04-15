{
  description = "rarick's dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = builtins.currentSystem;
      username = builtins.getEnv "USER";
      pkgs = import nixpkgs { inherit system; };
      homeDir = if pkgs.stdenv.isDarwin then "/Users/${username}" else "/home/${username}";
    in {
      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix ];
        extraSpecialArgs = { inherit username homeDir; };
      };
    };
}
