{config, ...}: {
  fileSystems."/mnt/disque" = {
    device = "/dev/sda2"; # Remplace par ton UUID
    fsType = "ext4";
    options = ["nofail"]; # Pas d'echec si disque absent au démarrage
  };
}
