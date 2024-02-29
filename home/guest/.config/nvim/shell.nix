{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.nodejs
    pkgs.unzip
    pkgs.luarocks
  ];

  shellHook = ''
    # Any additional shell setup can go here
  '';
}
