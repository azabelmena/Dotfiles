{
  "/boot" =
    {
      device = "/dev/disk/by-uuid/E820-7F6C";
      fsType = "vfat";
    };

  "/" =
    {
      device = "/dev/disk/by-uuid/251add71-65ad-4464-9a41-2f5a52d9e784";
      fsType = "ext4";
    };

  "/mnt/storage" =
    {
      device = "/dev/disk/by-uuid/7554707e-0473-41dc-a6af-1e3cc77825f9";
      fsType = "btrfs";
    };

  "/mnt/games" =
    {
      device = "/dev/disk/by-uuid/747a30ab-b445-4f3b-a276-67da3eff89a8";
      fsType = "ext4";
    };
}
