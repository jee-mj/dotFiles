#!/bin/sh

sudo nix-env --delete-generations old
sudo nix-collect-garbage -d