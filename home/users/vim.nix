# home.nix
{
  config,
  pkgs,
  user,
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
      sessionVariables = {
        EDITOR = "nvim";
      };
    };
  };
}
