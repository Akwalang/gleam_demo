{ pkgs }:

pkgs.mkShell {
  packages = with pkgs; [
    # toolchains
    erlang
    gleam
    rebar3

    # infra
    postgresql_16
    redis

    # tooling
    git
    curl
    jq
  ];

  shellHook = ''
    export PGDATA=$PWD/.pgdata
    export REDIS_DIR=$PWD/.redis

    echo "🚀 Dev environment ready"
  '';
}
