{unstable, pkgs, lib, ...}:
{
    home.packages = [
        (with pkgs.dotnetCorePackages; combinePackages [sdk_8_0 sdk_9_0])
    ];
}
