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

        erlang = pkgs.erlang_27;
        gleam = pkgsUnstable.gleam;
      in {
        devShells.default = pkgs.mkShell {
          packages = [
            gleam
            erlang
            pkgs.rebar3
          ];
        };
      }
    );
}
