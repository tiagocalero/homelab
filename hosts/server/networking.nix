{ network, ... }:
let
  srv = network.hosts.server;
in
{
  networking = {
    useDHCP = false;
    interfaces.${srv.interface}.ipv4.addresses = [
      {
        inherit (srv) address;
        inherit (network.lan) prefixLength;
      }
    ];
    defaultGateway = network.lan.gateway;
    nameservers = [ network.hosts.pi.address ];

    firewall.enable = true;
  };
}
