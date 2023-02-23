{
  description = "capsulecorp";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-22.11;
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }: utils.lib.eachDefaultSystem
    (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ self.overlay ];
        };
        capsulecorp = with pkgs; stdenv.mkDerivation {
          name = "capsulecorp";
          src = ./src;

          # buildPhase = ''
          #   ninja
          # '';

          installPhase = ''
            mkdir -p $out/
            cp *.html $out/
            cp -r txt $out/
            cp -r assets $out/
            cp robots.txt $out
          '';

          meta = with lib; {
            description = "capsulecorp site";
            homepage = https://capsulecorp.org;
            license = licenses.agpl3;
            maintainers = with maintainers; [ case ];
          };
        };
      in
      rec
      {
        packages.${system} = capsulecorp;
        defaultPackage = capsulecorp;
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            gnumake
            nixpkgs-fmt
          ];
        };
      }) // {
    overlay = final: prev: {
      capsulecorp = with final; (stdenv.mkDerivation {
        name = "capsulecorp";
        src = ./src;

        installPhase = ''
          mkdir -p $out/
          cp *.html $out/
          cp -r txt $out/
          cp -r assets $out/
          cp robots.txt $out
        '';

        meta = with lib; {
          description = "capsulecorp site";
          homepage = https://capsulecorp.org;
          license = licenses.agpl3;
          maintainers = with maintainers; [ case ];
        };
      });
    };
  };
}
