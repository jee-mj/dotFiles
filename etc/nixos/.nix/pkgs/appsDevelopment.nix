{ pkgs }:
with pkgs; [
  ansible
  gdb
  git
  gh
  insomnia
  lazygit
  vscode

  ## .NET
  dotnet-aspnetcore_7
  dotnet-runtime_8
  dotnet-runtime_7
  dotnet-runtime
  dotnetPackages.Nuget
  mono
  ## C/C++
  cmake gcc zig rPackages.pkgconfig
  ## Go
  go
  ## Database
  sqlite
]