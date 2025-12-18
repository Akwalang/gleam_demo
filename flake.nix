{
  description = "Gleam shop dev environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";

    # 👇 берём свежий nixpkgs ТОЛЬКО ради Gleam
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        pkgsUnstable = import nixpkgs-unstable { inherit system; };

        gleam = pkgsUnstable.gleam;
      in {
        devShells.default = pkgs.mkShell {
          packages = [
            gleam
            pkgs.erlang
            pkgs.rebar3
          ];
        };
      }
    );
}
