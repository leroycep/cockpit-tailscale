{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
  };

  outputs = { self, nixpkgs }: {
    packages.x86_64-linux.cockpit-tailscale = let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
    in
      pkgs.mkYarnPackage {
        name = "cockpit-tailscale";
        src = ./.;
        yarnLock = ./yarn.lock;
        yarnNix = ./yarn.nix;
      };

    packages.x86_64-linux.default = self.packages.x86_64-linux.cockpit-tailscale;
  };
}
