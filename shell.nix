
{ pkgs ? import <nixpkgs> {} }:
with pkgs;
mkShell {

  nativeBuildInputs = [
    clang
    cmake
    ninja
    pkg-config

    gtk3  # Curiously `nix-env -i` can't handle this one adequately.
          # But `nix-shell` on this shell.nix does fine.
    pcre
    epoxy

    # This group all seem not strictly necessary -- commands like
    # `flutter run -d linux` seem to *work* fine without them, but
    # the build does print messages about missing packages, like:
    #   Package mount was not found in the pkg-config search path.
    #   Perhaps you should add the directory containing `mount.pc'
    #   to the PKG_CONFIG_PATH environment variable
    libuuid  # for mount.pc
    xorg.libXdmcp.dev
    python310Packages.libselinux.dev # for libselinux.pc
    libsepol.dev
    libthai.dev
    libdatrie.dev
    libxkbcommon.dev
    dbus.dev
    at-spi2-core.dev
    xorg.libXtst.out

    jdk11
    android-studio
    android-tools
  ];
}
