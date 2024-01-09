{
  "/" =
    { device = "/dev/disk/by-uuid/d4789a80-7bcf-4c4b-bbed-880930072bf8";
      fsType = "ext4";
    };

  "/mnt/games" =
    { device = "/dev/disk/by-uuid/747a30ab-b445-4f3b-a276-67da3eff89a8";
      fsType = "ext4";
    };

  "/boot" =
    { device = "/dev/disk/by-uuid/BD24-3919";
      fsType = "vfat";
    };

  "/mnt/storage" =
    { device = "/dev/disk/by-uuid/7554707e-0473-41dc-a6af-1e3cc77825f9";
      fsType = "btrfs";
    };
}
