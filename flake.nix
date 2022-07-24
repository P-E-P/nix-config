{
  description = "Nixos configuration with flakes";

  inputs = {
    nixpkgs = {
      type = "github";
      owner = "NixOs";
      repo = "nixpkgs";
      ref = "nixos-unstable";
    };

    home-manager = {
      type = "github";
      owner = "nix-community";
      repo = "home-manager";
      ref = "master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils = {
      type = "github";
      owner = "numtide";
      repo = "flake-utils";
      ref = "master";
    };

  };

  outputs = { self, nixpkgs, home-manager, ... } @inputs: {
    nixosModules = {
      home = {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.und = import ./home;
        home-manager.verbose = true;
      };
      nix-path = {
        nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
      };
    };

    overlays = import ./overlays;

    nixosConfigurations =
      let
        system = "x86_64-linux";
        shared_overlays = [
          (self: super: {
            packages = import ./pkgs { pkgs = super; };
          })
        ] ++ builtins.attrValues self.overlays;

        sharedModules = [
          home-manager.nixosModule
          { nixpkgs.overlays = shared_overlays; }
        ] ++ (nixpkgs.lib.attrValues self.nixosModules);
      in {
        lambda = nixpkgs.lib.nixosSystem {
          inherit system;
          modules =
            [
              ./lambda.nix
            ] ++ sharedModules;
        };
        alpha = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./alpha.nix
          ] ++ sharedModules;
        };
      };

  };
}
