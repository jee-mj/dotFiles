{ pkgs }:
with pkgs; [
  gdb
  git
  gh

  figma-linux
  insomnia
  vscode

  # SQL
  sqlite
  sqlitebrowser

  # MongoDB
  mongoc
  mongosh
  mongocxx
  mongodb-tools
  mongodb-compass

  ## C/C++
  cmake gcc zig rPackages.pkgconfig

  ## Go
  go

  ## .NET
  dotnet-aspnetcore_8
  dotnet-runtime_8
  dotnet-sdk_8
  dotnetPackages.Nuget
  mono

  # PHP
  php
  php82Packages.composer

  # Node.JS
  nodejs_20
]
