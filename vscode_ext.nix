{ pkgs, lib }:

let
  inherit (pkgs.stdenv) isDarwin isLinux isi686 isx86_64 isAarch32 isAarch64;
  vscode-utils = pkgs.vscode-utils;
  merge = lib.attrsets.recursiveUpdate;
in
merge
  (merge
    (merge
      (merge
      {
        # "codeium"."codeium" = vscode-utils.extensionFromVscodeMarketplace {
        #   name = "codeium";
        #   publisher = "codeium";
        #   version = "1.11.6";
        #   sha256 = "0x1v81vl9l3lw2ag0n7llqczlmyy78f90hic4pldiqimn9bljkki";
        # };
        "geequlim"."godot-tools" = vscode-utils.extensionFromVscodeMarketplace {
          name = "godot-tools";
          publisher = "geequlim";
          version = "2.0.0";
          sha256 = "1z2m38vbcdhpy2kwdprhxy3dqqgj1y58w3pm96x9k8d8l73sjm7a";
        };
      }
        (lib.attrsets.optionalAttrs (isLinux && (isi686 || isx86_64)) { }))
      (lib.attrsets.optionalAttrs (isLinux && (isAarch32 || isAarch64)) { }))
    (lib.attrsets.optionalAttrs (isDarwin && (isi686 || isx86_64)) { }))
  (lib.attrsets.optionalAttrs (isDarwin && (isAarch32 || isAarch64)) { })