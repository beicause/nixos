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
        "geequlim"."godot-tools" = vscode-utils.extensionFromVscodeMarketplace {
          name = "godot-tools";
          publisher = "geequlim";
          version = "2.1.0";
          sha256 = "174wxicrjr9crh28vrbxrr097y5yqjkjqq3yk5nkawhpjhhghh7z";
        };
        "grafana"."vscode-jsonnet" = vscode-utils.extensionFromVscodeMarketplace {
          name = "vscode-jsonnet";
          publisher = "grafana";
          version = "0.6.1";
          sha256 = "1394dqdw14351z5f6zfjz0i1vq3d89vyik6qyf12wbrxkc8gvpzj";
        };
      }
        (lib.attrsets.optionalAttrs (isLinux && (isi686 || isx86_64)) { }))
      (lib.attrsets.optionalAttrs (isLinux && (isAarch32 || isAarch64)) { }))
    (lib.attrsets.optionalAttrs (isDarwin && (isi686 || isx86_64)) { }))
  (lib.attrsets.optionalAttrs (isDarwin && (isAarch32 || isAarch64)) { })

