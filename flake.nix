{
  description = "Harsh Verma's nix-os dotfiles";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
  };

  outputs = {self, nixpkgs, ...}:
    let 
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./configuration.nix ];
        };
      };
    };

}