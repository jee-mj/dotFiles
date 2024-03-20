{config, pkgs, ...}: {

  # Enable Apache HTTP server
  services.httpd = {
    enable = true;
    adminAddr = "admin@example.com"; # Change accordingly
    enablePHP = true;
    phpPackage = pkgs.php; # Specify the PHP package
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
