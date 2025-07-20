{config, ...}: {
  fileSystems."/mnt/disque" = {
    device = "/dev/disk/by-uuid/249E-DA70"; # Remplace par ton UUID
    fsType = "exfat";
    options = ["nofail" "uid=1000" "gid=169" "umask=002"]; # Pas d'echec si disque absent au démarrage
  };
}
