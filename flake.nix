{
  description = "QML Example Project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-22.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }: let
    supportedSystems = let
      inherit (flake-utils.lib) system;
    in [
      system.aarch64-linux
      system.x86_64-linux
    ];
  in
    flake-utils.lib.eachSystem supportedSystems (system: let
      pkgs = import nixpkgs {inherit system;};
    in {
      devShell =
        pkgs.mkShell.override
        {
          stdenv = pkgs.clangStdenv;
        }
        {
          packages = with pkgs; [
            # editor
            bear

            # build tools
            qt6.qmake
            gnumake

            # deps
            qt6.qtbase.dev
            qt6.qtbase
            qt6.qtdeclarative
          ];

          shellHook = ''
            export QT_PLUGIN_PATH=${pkgs.qt6.qtbase}/lib/qt-6/plugins:$QT_PLUGIN_PATH
          '';
        };

      formatter = pkgs.alejandra;
    });
}
