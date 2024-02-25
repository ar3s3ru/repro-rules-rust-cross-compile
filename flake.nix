{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs {
            inherit system overlays;
            config.allowUnfree = true;
          };
        in
        {
          devShells.default = pkgs.mkShell {
            name = "default";

            buildInputs = with pkgs; [
              # aspect-cli # This brings in Bazel!
              bazel_6
              bazel-buildtools
            ];
          };
        }
      );
}
