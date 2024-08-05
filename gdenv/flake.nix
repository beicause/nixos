{
  description = "Godot development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      deps = with pkgs; [
        pkg-config
        autoPatchelfHook
        clang_18
        mold
        python3
        scons
        cxx-rs
        pre-commit
        nodejs_22
        rustup
        cargo-ndk
        jdk17
        android-studio-tools
        cmake
        ninja
        # Install Android SDK:
        # sdkmanager --sdk_root=<android_sdk_path> --licenses
        # sdkmanager --sdk_root=<android_sdk_path> "platform-tools" "build-tools;34.0.0" "platforms;android-34" "cmdline-tools;latest" "cmake;3.10.2.4988404" "ndk;23.2.8568313"
      ];
      extra_envs = {
        ANDROID_HOME = "/home/lzh/Android/";
        ANDROID_NDK_HOME = extra_envs.ANDROID_HOME + "ndk/23.2.8568313/";
        NIX_SHELL_NAME = "gd-fhs";
      };
      fhs_env =
        { name, script }:
        (pkgs.buildFHSUserEnv (
          pkgs.appimageTools.defaultFhsEnvArgs
          // {
            name = name;
            targetPkgs = pkgs: deps;
            profile = ''
              export IN_NIX_SHELL=1;
              export FHS=1
              export ANDROID_HOME="${extra_envs.ANDROID_HOME}";
              export ANDROID_NDK_HOME="${extra_envs.ANDROID_NDK_HOME}";
              export NIX_SHELL_NAME="${extra_envs.NIX_SHELL_NAME}";
              export LDFLAGS="-B/usr/bin/"
              export MINGW_PREFIX=/home/lzh/Document/llvm-mingw-20240619-ucrt-ubuntu-20.04-x86_64/
            '';
            runScript = script;
            extraOutputsToInstall = [ "dev" ];
          }
        ));
    in
    {
      packages."${system}" = {
        gdenv = (
          fhs_env {
            name = "gdenv";
            script = "fish";
          }
        );
        godot = (
          fhs_env {
            name = "godot";
            script = "/home/lzh/Document/godot/bin/godot.linuxbsd.editor.x86_64.llvm";
          }
        );
      };
    };
}
