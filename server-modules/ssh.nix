{ config, ... }: {
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    openFirewall = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      AllowUsers = [ config.var.username ];
    };
  };

  users.users."${config.var.username}" = {
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMsjOtvwfTcKXZXo1LAXu9Z14xHxmYB0Co8C17Ad9slg catonquentin150802@gmail.com",
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMgAbF5PAQYLfkI8I9x08DL8GMzMlxmRasz7BeA15SDY Serveur"
    ];
  };
}
