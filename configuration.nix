# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];
  services.v2raya = { enable = true; };
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

  zramSwap = {
    enable = true;
    memoryMax = 24 * 1024 * 1024 * 1024;
    algorithm = "zstd";
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
  networking.networkmanager.enable =
    true; # Easiest to use and most distros use this by default.

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
      monospace =
        [ "Noto Sans Mono CJK SC" "Sarasa Mono SC" "DejaVu Sans Mono" ];
      sansSerif = [ "Noto Sans CJK SC" "Source Han Sans SC" "DejaVu Sans" ];
      serif = [ "Noto Serif CJK SC" "Source Han Serif SC" "DejaVu Serif" ];
    };
  };
  i18n.defaultLocale = "zh_CN.UTF-8";
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = with pkgs; [ fcitx5-chinese-addons fcitx5-material-color ];
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
  services = { desktopManager.plasma6.enable = true; };
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable sound.
  hardware.pulseaudio.enable = true;

  users.users.lzh = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [ ];
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    ncdu
    kdePackages.yakuake
    firefox
    vscode.fhs
    nil
    nixfmt
    python3
    rustup
  ];
  nixpkgs.config.allowUnfree = true;

  environment.variables.EDITOR = "code --wait";
  services.openssh.enable = true;

  programs.fish = { enable = true; };
  nix.settings.substituters =
    [ "https://mirror.sjtu.edu.cn/nix-channels/store" ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "unstable"; # Did you read the comment?

}
