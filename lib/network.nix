{
  lan = {
    subnet = "192.168.0.0/24";
    prefixLength = 24;
    gateway = "192.168.0.1"; # TP-Link router
  };

  hosts = {
    pi = {
      address = "192.168.0.2"; # Raspberry Pi 4: WireGuard + Pi-hole
    };
    server = {
      hostName = "server";
      address = "192.168.0.10"; # NixOS application server
      interface = "enp1s0";
    };
  };

  wireguard = {
    port = 51820;
    subnet = "10.6.0.0/24"; # PiVPN default
  };
}
