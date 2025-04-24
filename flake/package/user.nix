{pkgs}:
with pkgs; [
  autojump
  eza
  fd
  fzf
  lsof
  lsd
  p7zip
  ripgrep
  strace

  barrier
  brave
  tor-browser

  gimp
  hypnotix
  inkscape
  kdenlive
  libreoffice-qt
  notable
  obs-studio
  livebook

  caprine-bin
  discord
  element-desktop
  hexchat
  # teams-for-linux # depends on electron 29.4.6 (eol)
  telegram-desktop
  revolt-desktop
  session-desktop
  signal-desktop
  slack
  ssh-chat
  # wire-desktop # insecure
  whatsapp-for-linux
  whatsapp-chat-exporter
  zulip

  arion
  docker
  docker-client
  docker-compose
  nfs-utils
  nvidia-docker
  boxbuddy
  distrobox
]
