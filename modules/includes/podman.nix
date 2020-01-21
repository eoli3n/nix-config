{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ podman podman-compose runc conmon slirp4netns fuse-overlayfs ];

  users.users.user.subUidRanges = [{ startUid = 100000; count = 65536; }];
  users.users.user.subGidRanges = [{ startGid = 100000; count = 65536; }];

  environment.etc."containers/registries.conf" = {
    mode="0644";
    text=''
      [registries.search]
      registries = ['docker.io', 'quay.io']
    '';
  };
}
