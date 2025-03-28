{
  description = "A cybernetic cooperative experiment.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      withSystem = nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-linux"
        "aarch64-darwin"
      ];

      withPkgs =
        callback:
        withSystem (
          system:
          callback (
            import nixpkgs {
              inherit system;
            }
          )
        );
    in
    {
      devShells = withPkgs (pkgs: {
        default = pkgs.mkShell {
          # Project Dependencies
          packages = [
            pkgs.go
            pkgs.gnumake
            pkgs.libclang
            # Need to repackage for Nix
            # protoc-gen-gogofaster
            # https://github.com/gogo/protobuf/tree/master/protoc-gen-gogofaster
          ];

          # Development Environment Variables
          env = { };
        };
      });

      formatter = withPkgs (pkgs: pkgs.nixfmt-rfc-style);
    };
}
