{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  buildInputs = [
    pkgs.nodejs_18
    pkgs.unzip
    pkgs.luarocks
  ];
}
