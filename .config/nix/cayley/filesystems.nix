{
  "/boot" =
    {
      device = "/dev/disk/by-uuid/9DAD-4E6C";
      fsType = "vfat";
    };

  "/" =
    {
      device = "/dev/disk/by-uuid/1a22ddbf-99c4-46da-841e-a40269b169d2";
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
