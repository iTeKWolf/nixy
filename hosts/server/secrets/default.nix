{pkgs, ...}: {
  sops = {
    age.keyFile = "/home/wolf/.config/sops/age/keys.txt";
    defaultSopsFile = ./secrets.yaml;
    secrets = {
      sshconfig = {
        owner = "wolf";
        path = "/home/wolf/.ssh/config";
        mode = "0600";
      };
      github-key = {
        owner = "wolf";
        path = "/home/wolf/.ssh/github";
        mode = "0600";
      };
      #cloudflare-dns-token = {path = "/etc/cloudflare/dnskey.txt";};
      nextcloud-pwd = {path = "/etc/nextcloud/pwd.txt";};
      adguard-pwd = {};
      hoarder = {};
    };
  };

  environment.systemPackages = with pkgs; [sops age];
}
