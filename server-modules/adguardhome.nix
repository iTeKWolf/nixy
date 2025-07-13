{ config, ... }:
let domain = "adguard.hadi.diy";
in {
  services = {
    adguardhome = {
      enable = true;
      port = 3000;
      #reco GPT
      settings.bind_host = "0.0.0.0";  # Important pour accès via Tailscale
    };

    #nginx.virtualHosts."${domain}" = {
    #  useACMEHost = "hadi.diy";
    #  forceSSL = true;
    #  locations."/" = {
    #    proxyPass =
    #      "http://127.0.0.1:${toString config.services.adguardhome.port}";
    #  };
    };
  };
}
