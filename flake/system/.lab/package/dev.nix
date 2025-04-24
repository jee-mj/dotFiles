{pkgs}:
with pkgs; [
  direnv
  devenv
  gh # TODO: remove once supported in home-manager
  zig
  statix
  # microsoft-edge
  distrobox
  boxbuddy
  pgadmin4-desktopmode
  google-cloud-sdk
  nodejs_23 pnpm yarn
  python3Full uv poetry
  dotnetCorePackages.dotnet_9.sdk
  dotnetCorePackages.dotnet_9.aspnetcore
  powershell

]
