{config, pkgs, ...}:
{
  services.ollama = {
    acceleration = "cuda";
    enable = true;
  };

  ## lAMp
  ## lAMp
  ## lAMp

  # Enable localhost (httpd)
  services.httpd = {
    enable = true;
    adminAddr = "dev@zone.au";
    enablePHP = true;
    phpPackage = pkgs.php;
    virtualHosts.localhost = {
        documentRoot = "/share/www/public";
      };
  };
  # Enable MySQL (MariaDB)
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };
  # Enable NoSQL (MongoDB)
  services.mongodb = {
    enable = true;
    package = pkgs.mongodb;
  };
}