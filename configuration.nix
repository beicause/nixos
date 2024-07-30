# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{
  config,
  lib,
  pkgs,
  ...
}:
let
  ext = (import ./vscode_ext.nix) {
    pkgs = pkgs;
    lib = lib;
  };
in
{
  imports = [ ./hardware-configuration.nix ];
  services.v2raya = {
    enable = true;
  };
  # Use the systemd-boot EFI boot loader.
  # boot.loader.systemd-boot.enable = true;
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      extraEntries = ''
        menuentry "Windows" {
            search --file --no-floppy --set=root /EFI/Microsoft/Boot/bootmgfw.efi
            chainloader (''${root})/EFI/Microsoft/Boot/bootmgfw.efi
        }
      '';
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };
  boot.kernel.sysctl = {
    "vm.page-cluster" = 0;
    "vm.extfrag_threshold" = 0;
    "vm.swappiness" = 100;
    "kernel.yama.ptrace_scope" = 0;
  };

  zramSwap = {
    enable = true;
    memoryMax = 32 * 1024 * 1024 * 1024;
    algorithm = "zstd";
    memoryPercent = 200;
  };

  # Limit the number of generations to keep
  boot.loader.systemd-boot.configurationLimit = 5;
  boot.loader.grub.configurationLimit = 5;

  # Perform garbage collection weekly to maintain low disk usage
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };

  # Optimize storage
  # You can also manually optimize the store via:
  #    nix-store --optimise
  # Refer to the following link for more details:
  # https://nixos.org/manual/nix/stable/command-ref/conf-file.html#conf-auto-optimise-store
  nix.settings.auto-optimise-store = true;

  networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";
  fonts = {
    packages = with pkgs; [
      noto-fonts
      # noto-fonts-cjk-sans
      # noto-fonts-cjk-serif
      source-han-sans
      source-han-serif
      # sarasa-gothic  #更纱黑体
      # source-code-pro
      # hack-font
      # jetbrains-mono
    ];
  };

  fonts.fontconfig = {
    defaultFonts = {
      emoji = [ "Noto Color Emoji" ];
      monospace = [
        "Noto Sans Mono CJK SC"
        "Sarasa Mono SC"
        "DejaVu Sans Mono"
      ];
      sansSerif = [
        "Noto Sans CJK SC"
        "Source Han Sans SC"
        "DejaVu Sans"
      ];
      serif = [
        "Noto Serif CJK SC"
        "Source Han Serif SC"
        "DejaVu Serif"
      ];
    };
  };
  i18n.defaultLocale = "zh_CN.UTF-8";
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = with pkgs; [
      fcitx5-chinese-addons
      fcitx5-material-color
    ];
  };
  services.displayManager = {
    sddm = {
      enable = true;
      wayland = {
        enable = true;
        compositor = "kwin";
      };
    };
    autoLogin = {
      enable = true;
      user = "lzh";
    };
  };
  services = {
    desktopManager.plasma6.enable = true;
  };
  hardware.pulseaudio.enable = true;
  users.users.lzh = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      nil
      nixfmt-rfc-style
      (vscode-with-extensions.override {
        vscodeExtensions = with vscode-extensions; [
          zhuangtongfa.material-theme
          jnoortheen.nix-ide
          yzhang.markdown-all-in-one
          ms-vscode-remote.remote-ssh
          ms-python.python
          ms-python.black-formatter
          llvm-vs-code-extensions.vscode-clangd
          vadimcn.vscode-lldb
          rust-lang.rust-analyzer
          redhat.vscode-xml
          redhat.vscode-yaml
          eamodio.gitlens
          tamasfe.even-better-toml
          usernamehw.errorlens
          continue.continue
          ext.geequlim.godot-tools
        ];
      })
    ];
  };
  environment.systemPackages = with pkgs; [
    vim
    curl
    wget
    git
    ncdu
    kdePackages.yakuake
    firefox
    python3
    rustup
    clang_18
    clang-tools
    just
  ];

  nixpkgs.config.allowUnfree = true;
  environment.variables.EDITOR = "code --wait";
  services.openssh.enable = true;
  systemd.user.services.xdg-user-dirs_workaround = {
    description = "(Workaround to https://github.com/NixOS/nixpkgs/issues/222925) User folders update";
    documentation = [ "man:xdg-user-dirs-update(1)" ];
    path = [ pkgs.xdg-user-dirs ];
    wantedBy = [ "graphical-session-pre.target" ];
    unitConfig.RequiresMountsFor = "/home";
    serviceConfig.Type = "oneshot";
    script = "${pkgs.bash}/bin/xdg-user-dirs-update";
  };
  environment.etc."xdg/user-dirs.defaults".text = ''
    DESKTOP=Desktop
    DOWNLOAD=Download
    TEMPLATES=Template
    PUBLICSHARE=Public
    DOCUMENTS=Document
    MUSIC=Music
    PICTURES=Picture
    VIDEOS=Video
  '';
  programs = {
    fish.enable = true;
    direnv.enable = true;
    nix-ld.enable = true;
  };
  nix.settings.substituters = [ "https://mirror.sjtu.edu.cn/nix-channels/store" ];
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  system.stateVersion = "24.05";

}
