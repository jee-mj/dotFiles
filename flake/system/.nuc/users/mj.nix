{
  inputs,
  user, hostnameroot,
  specialArgs, options, modulesPath,
  lib, pkgs, config, 
}: {
  users = {
    users = {
      mj = {
        group = "users";
        isNormalUser = true;
        description = "vimv";
        extraGroups = ["networkmanager" "wheel" "disk" "sshd"];
        home = "/home/mj";
        shell = pkgs.fish;
        openssh.authorizedKeys.keys = [
          "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCwplR1tjnanknlBNJ8Gc/DqQ7uZd/6vaKHnZRm3uUBBTyqwEIDEF6ZnVaJMwXKNcsI+XLCncdgQ3D9vFvQ5du2XQ576fwUVEljxjmQF5rBXKAx9amKNKKmHZAEblU2hDDFfsUaFafnQGCQUh0HzlzgyEjHUScugjC1RopZxMlQt/wdOHZmsbzKPckeX8dcT+OOljRqa2pmoNwlszVHrMrIpnd2pLC4+LSS1WwEvU+nUhLo/7nOYFGYyIfA2au7gC+HjqV9gl+5fAkEo96gjGmnrmBXgGrBQJNSUvspXFytHSbSWEkh00nEABgjPrv2AXlQ+F0UX8j49hq1mxvu70v45K3Y6JvdC95ZWfW9+n/3C5+tkXGLf1rHQPFmvP23a3tBzRQvsEBUlrP8EAMbBpCed+bk72B3AJGOJ8sYbl2Wpf2SXEocJ78VmwhJ2sVIbS2CvNwng6Bc9dIXTfzAb/Ybc7nJsraPXQvNg2Ex10D/AQTZrMUL0D9naaXKaqEI1mFb8dffaa1FsesVx0ZQjuxK97lngPBpUY8NhH82voJk+AEbE1nZJ90A1hNedxH40/u2Fgo7YBGnCXKKXxiA5+Ffp19Q5A6wg8g1XJUxBAmiolwlwuksvF0HUnhgNhguw2JoZ0EvLGLNGUyADxLXiI320CmzcG/GO3ghszYET9svbw== miraj.bhattarai@gmail.com"
        ];
      };
    };
  };
}
