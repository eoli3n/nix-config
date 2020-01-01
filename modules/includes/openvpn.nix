{ config, pkgs, ... }:

{
  services.openvpn.servers = {
    um = {
      config = '' config /root/openvpn/client.conf '';
      updateResolvConf = true;
    };
  };
}
