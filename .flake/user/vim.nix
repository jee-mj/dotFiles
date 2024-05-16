# home.nix
{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../bash.nix
    ../theme.nix
  ];

  config = {
    home = {
      username = "vim";
      homeDirectory = "/home/vimv";
      pointerCursor = {
        name = "macOS-Monterey";
        package = pkgs.apple-cursor;
      };
      stateVersion = "24.05";
      sessionVariables = {
        EDITOR = "nvim";
      };
    };
  };
}
