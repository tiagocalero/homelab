{ network, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./networking.nix
    ./ssh.nix
    ./maintenance.nix
  ];

  networking.hostName = network.hosts.server.hostName;

  time.timeZone = "America/Montevideo";
  i18n.defaultLocale = "en_US.UTF-8";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 10;

  users.users.tiago = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  security.sudo.wheelNeedsPassword = true;

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    trusted-users = [ "@wheel" ];
  };

  system.stateVersion = "26.05";
}
