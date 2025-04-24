{ config, pkgs, lib, inputs, hostnameroot, user, specialArgs, options, modulesPath }:
{
  nixpkgs.overlays = [ (
    self: super: {
      suipackage = super.stdenv.mkDerivation {
        name = "suipackage";

        src = super.fetchFromGitHub {
          owner = "MystenLabs";
          repo = "sui";
          rev = "b023ef895412b22a1db9490d266e96aa5925a890";
          hash = "";
        };

        buildInputs = [];

        buildPhase = ''
          echo "Building sui package"
        '';

        installPhase = ''
          mkdir -p $out/bin
        '';

        meta = with super.lib; {
          description = "SUI";
          homepage = "https://github.com/MystenLabs/sui";
        };
      };
    }
  ) ];
}
