{ pkgs }:
with pkgs; [
  dos2unix # WSL line-endings fix
  file
  gcc
  gdb
  nerdfonts
  openssl
]
