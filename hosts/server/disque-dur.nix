{config, ...}: {
  fileSystems."/mnt/disque" = {
    device = "/dev/disk/by-uuid/6F7F-DF73"; # Remplace par ton UUID
    fsType = "exfat";
    options = ["defaults" "nofail"]; # Pas de automount, pas de démontage auto
  };
}
