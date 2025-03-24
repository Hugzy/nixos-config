{unstable, pkgs, ...}:
{
    home.packages = [
        pkgs.rustup
        pkgs.clang
        pkgs.heaptrack
    ];
}
