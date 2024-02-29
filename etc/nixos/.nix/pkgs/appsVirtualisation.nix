{ pkgs }:
with pkgs; [
  arion
  docker
  docker-client
  docker-compose
  lutris
  nfs-utils
  nvidia-docker
  qemu
  virt-manager
  virtiofsd
  wineWowPackages.stable
]
