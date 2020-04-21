# This defines a function taking `pkgs` as parameter, and uses
# 
# `nixpkgs` by default if no argument is passed to it.
let 
 pkgs = import <nixpkgs> {} ;
 elixir = pkgs.beam.packages.erlangR22.elixir_1_10;
# This avoids typing `pkgs.` before each package name.
in
with pkgs;
# Defines a shell.

mkShell {
  # Sets the build inputs, i.e. what will be available in our
  # local environment.
  buildInputs = [elixir git nodejs-13_x postgresql glibcLocales];
  shellHooks = ''
    export glibcLocales=$(nix-build --no-out-link "<nixpkgs>" -A glibcLocales)
    export LOCALE_ARCHIVE_2_27="${glibcLocales}/lib/locale/locale-archive"
    export LANG=en_US.UTF-8
    export LC_ALL=en_US.UTF-8
    export PGDATABASE=domain_dev 
    export PGDATA="$PWD/nix/postgres/pgdata" 
    export PGSOCKETS="$PWD/nix/postgres/sockets" 
    export PGHOST="localhost" 
    export PGPORT="5432" 
    export PGUSER="$USER"
    trap "'$PWD/nix/client' remove" EXIT
    nix/client add
    
  '';

}
