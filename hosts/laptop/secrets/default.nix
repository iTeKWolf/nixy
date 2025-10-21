# Those are my secrets, encrypted with sops
# You shouldn't import this file, unless you edit it
{ pkgs, inputs, ... }: {
  imports = [ inputs.sops-nix.homeManagerModules.sops ];

  sops = {
    age.keyFile = "/home/quent01/.config/sops/age/keys.txt";
    defaultSopsFile = ./secrets.yaml;
    secrets = {
      sshconfig = { path = "/home/quent01/.ssh/config"; };
      github-key = { path = "/home/quent01/.ssh/github"; };
      gitlab-key = { path = "/home/quent01/.ssh/gitlab"; };
    };
  };

  home.file.".config/nixos/.sops.yaml".text = ''
    keys:
      - &primary age14ha0fy674zfluws05gv6zc69k64aqqt7jpqcsfj42mu2dcmx4dzq69sd5p
    creation_rules:
      - path_regex: hosts/laptop/secrets/secrets.yaml$
        key_groups:
          - age:
            - *primary
      - path_regex: hosts/server/secrets/secrets.yaml$
        key_groups:
          - age:
            - *primary
  '';

  systemd.user.services.mbsync.Unit.After = [ "sops-nix.service" ];
  home.packages = with pkgs; [ sops age ];

  wayland.windowManager.hyprland.settings.exec-once =
    [ "systemctl --user start sops-nix" ];
}
