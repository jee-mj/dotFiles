{ pkgs }:
with pkgs; [
  bionic
  gcc_multi
  gdb
  libgcc
  libcxx libstdcxx5
  musl
  newlib
  uclibc
]
