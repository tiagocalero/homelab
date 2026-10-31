{ ... }:
{
  # Delete old generations weekly
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
  nix.optimise.automatic = true;

  services.fstrim.enable = true;
}
