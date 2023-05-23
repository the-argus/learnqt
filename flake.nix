{
  description = "QML Example Project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable";
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
        pkgs.mkShell
        {
          packages = with pkgs; [
            # build tools
            qt6.qmake
            gnumake
            cmake

            # deps
            qt6.qtbase
            qt6.qtdeclarative
            qt6.qt5compat
            qtcreator-qt6
          ];

          shellHook = ''
            export QT_PLUGIN_PATH=${pkgs.qt6.qtbase}/lib/qt-6/plugins:$QT_PLUGIN_PATH
            export QML2_IMPORT_PATH=${pkgs.qt6.qtdeclarative}/lib/qt-6/qml
          '';
        };

      formatter = pkgs.alejandra;
    });
}
