# home.nix
{
  config,
  pkgs,
  user
}: {
  imports = [
    ../bash.nix
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
