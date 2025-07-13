{ config, ... }: {
  services.nginx = { enable = true; };

  #security.acme = {
  #  acceptTerms = true;
  #  defaults.email = config.var.git.email;
  #};

  #security.acme.certs."hadi.diy" = {
  #  domain = "hadi.diy";
  #  extraDomainNames = [ "*.hadi.diy" ];
  #  group = "nginx";
  #
  #  dnsProvider = "cloudflare";
  #  dnsPropagationCheck = true;
  #  credentialsFile = config.sops.secrets.cloudflare-dns-token.path;
  #};

  services.nginx.virtualHosts = {
    "default" = {
      default = true;
      locations."/" = { return = 444; };
    };
    "*.mynixserveur" = {
    #  useACMEHost = "mynixserveur";
    #  forceSSL = true;
      locations."/" = { return = 444; };
    };
    "aaaaaa.mynixserveur" = {
    #  useACMEHost = "mynixserveur";
    #  forceSSL = true;
      locations."/" = { return = 444; };
    };
  };

  networking.firewall.allowedTCPPorts = [ 80 ];
  networking.firewall.allowedUDPPorts = [ 80 ];
}
