{ config, pkgs,lib, ... }:
let username = "lzh";
  ext = (import ./vscode_ext.nix) {
    pkgs = pkgs;
    lib = lib;
  };
in {
  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "24.05";
  };
  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "Luo Zhihao";
    userEmail = "luo_zhihao_jx@qq.com";
  };

  programs.vscode = {
    enable = true;
    mutableExtensionsDir=false;
    extensions = with pkgs.vscode-extensions; [
          zhuangtongfa.material-theme
          jnoortheen.nix-ide
          yzhang.markdown-all-in-one
          ms-vscode-remote.remote-ssh
          ms-python.python
          charliermarsh.ruff
          llvm-vs-code-extensions.vscode-clangd
          rust-lang.rust-analyzer
          redhat.vscode-xml
          redhat.vscode-yaml
          eamodio.gitlens
          redhat.vscode-xml
          redhat.vscode-yaml
          tamasfe.even-better-toml
          usernamehw.errorlens
          ext.geequlim.godot-tools
          ext.codeium.codeium
    ];
    userSettings = {
      "workbench.colorTheme" = "One Dark Pro Darker";
      "editor.fontSize" = 16;
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";
      "nix.formatterPath" = "nixfmt";
      "nix.serverSettings" = {
        "nil" = { "formatting" = { "command" = [ "nixfmt" ]; }; };
      };
      "terminal.integrated.defaultProfile.linux" = "fish";
      "explorer.confirmDelete" = false;
      "git.confirmSync" = false;
      "editor.guides.bracketPairs" = true;
    };
  };

  programs.plasma = {
    enable = true;
    shortcuts = {
      "ActivityManager"."switch-to-activity-646008db-b807-4cfb-a6f1-f8aa35c92990" =
        [ ];
      "KDE Keyboard Layout Switcher"."Switch keyboard layout to English (US)" =
        [ ];
      "KDE Keyboard Layout Switcher"."Switch to Last-Used Keyboard Layout" =
        "Meta+Alt+L";
      "KDE Keyboard Layout Switcher"."Switch to Next Keyboard Layout" =
        "Meta+Alt+K";
      "kaccess"."Toggle Screen Reader On and Off" = "Meta+Alt+S";
      "kcm_touchpad"."Disable Touchpad" = "Touchpad Off";
      "kcm_touchpad"."Enable Touchpad" = "Touchpad On";
      "kcm_touchpad"."Toggle Touchpad" = [
        "Touchpad Toggle"
        "Meta+Ctrl+Zenkaku Hankaku,Touchpad Toggle"
        "Meta+Ctrl+Zenkaku Hankaku"
      ];
      "kmix"."decrease_microphone_volume" = "Microphone Volume Down";
      "kmix"."decrease_volume" = "Volume Down";
      "kmix"."decrease_volume_small" = "Shift+Volume Down";
      "kmix"."increase_microphone_volume" = "Microphone Volume Up";
      "kmix"."increase_volume" = "Volume Up";
      "kmix"."increase_volume_small" = "Shift+Volume Up";
      "kmix"."mic_mute" = [
        "Microphone Mute"
        "Meta+Volume Mute,Microphone Mute"
        "Meta+Volume Mute,麦克风静音"
      ];
      "kmix"."mute" = "Volume Mute";
      "ksmserver"."Halt Without Confirmation" = "none,,关机 (无需确认)";
      "ksmserver"."Lock Session" =
        [ "Meta+L" "Screensaver,Meta+L" "Screensaver,锁定会话" ];
      "ksmserver"."Log Out" = "Ctrl+Alt+Del";
      "ksmserver"."Log Out Without Confirmation" = "none,,注销 (无需确认)";
      "ksmserver"."LogOut" = "none,,注销";
      "ksmserver"."Reboot" = "none,,重启";
      "ksmserver"."Reboot Without Confirmation" = "none,,重启 (无需确认)";
      "ksmserver"."Shut Down" = "none,,关机";
      "kwin"."Activate Window Demanding Attention" = "Meta+Ctrl+A";
      "kwin"."Cycle Overview" = [ ];
      "kwin"."Cycle Overview Opposite" = [ ];
      "kwin"."Decrease Opacity" = "none,,降低活动窗口不透明度 5%";
      "kwin"."Edit Tiles" = "Meta+T";
      "kwin"."Expose" = "Ctrl+F9";
      "kwin"."ExposeAll" =
        [ "Ctrl+F10" "Launch (C),Ctrl+F10" "Launch (C),显示/隐藏窗口平铺 (全部桌面)" ];
      "kwin"."ExposeClass" = "Ctrl+F7";
      "kwin"."ExposeClassCurrentDesktop" = [ ];
      "kwin"."Grid View" = "Meta+G";
      "kwin"."Increase Opacity" = "none,,提高活动窗口不透明度 5%";
      "kwin"."Kill Window" = "Meta+Ctrl+Esc";
      "kwin"."Move Tablet to Next Output" = [ ];
      "kwin"."MoveMouseToCenter" = "Meta+F6";
      "kwin"."MoveMouseToFocus" = "Meta+F5";
      "kwin"."MoveZoomDown" = [ ];
      "kwin"."MoveZoomLeft" = [ ];
      "kwin"."MoveZoomRight" = [ ];
      "kwin"."MoveZoomUp" = [ ];
      "kwin"."Overview" = "Meta+W";
      "kwin"."Setup Window Shortcut" = "none,,设置窗口快捷键";
      "kwin"."Show Desktop" = "Meta+D";
      "kwin"."Switch One Desktop Down" = "Meta+Ctrl+Down";
      "kwin"."Switch One Desktop Up" = "Meta+Ctrl+Up";
      "kwin"."Switch One Desktop to the Left" = "Meta+Ctrl+Left";
      "kwin"."Switch One Desktop to the Right" = "Meta+Ctrl+Right";
      "kwin"."Switch Window Down" = "Meta+Alt+Down";
      "kwin"."Switch Window Left" = "Meta+Alt+Left";
      "kwin"."Switch Window Right" = "Meta+Alt+Right";
      "kwin"."Switch Window Up" = "Meta+Alt+Up";
      "kwin"."Switch to Desktop 1" = "Ctrl+F1";
      "kwin"."Switch to Desktop 10" = "none,,切换到桌面 10";
      "kwin"."Switch to Desktop 11" = "none,,切换到桌面 11";
      "kwin"."Switch to Desktop 12" = "none,,切换到桌面 12";
      "kwin"."Switch to Desktop 13" = "none,,切换到桌面 13";
      "kwin"."Switch to Desktop 14" = "none,,切换到桌面 14";
      "kwin"."Switch to Desktop 15" = "none,,切换到桌面 15";
      "kwin"."Switch to Desktop 16" = "none,,切换到桌面 16";
      "kwin"."Switch to Desktop 17" = "none,,切换到桌面 17";
      "kwin"."Switch to Desktop 18" = "none,,切换到桌面 18";
      "kwin"."Switch to Desktop 19" = "none,,切换到桌面 19";
      "kwin"."Switch to Desktop 2" = "Ctrl+F2";
      "kwin"."Switch to Desktop 20" = "none,,切换到桌面 20";
      "kwin"."Switch to Desktop 3" = "Ctrl+F3";
      "kwin"."Switch to Desktop 4" = "Ctrl+F4";
      "kwin"."Switch to Desktop 5" = "none,,切换到桌面 5";
      "kwin"."Switch to Desktop 6" = "none,,切换到桌面 6";
      "kwin"."Switch to Desktop 7" = "none,,切换到桌面 7";
      "kwin"."Switch to Desktop 8" = "none,,切换到桌面 8";
      "kwin"."Switch to Desktop 9" = "none,,切换到桌面 9";
      "kwin"."Switch to Next Desktop" = "none,,切换到下一桌面";
      "kwin"."Switch to Next Screen" = "none,,切换到下一屏幕";
      "kwin"."Switch to Previous Desktop" = "none,,切换到上一桌面";
      "kwin"."Switch to Previous Screen" = "none,,切换到上一屏幕";
      "kwin"."Switch to Screen 0" = "none,,切换到屏幕 0";
      "kwin"."Switch to Screen 1" = "none,,切换到屏幕 1";
      "kwin"."Switch to Screen 2" = "none,,切换到屏幕 2";
      "kwin"."Switch to Screen 3" = "none,,切换到屏幕 3";
      "kwin"."Switch to Screen 4" = "none,,切换到屏幕 4";
      "kwin"."Switch to Screen 5" = "none,,切换到屏幕 5";
      "kwin"."Switch to Screen 6" = "none,,切换到屏幕 6";
      "kwin"."Switch to Screen 7" = "none,,切换到屏幕 7";
      "kwin"."Switch to Screen Above" = "none,,切换到上方屏幕";
      "kwin"."Switch to Screen Below" = "none,,切换到下方屏幕";
      "kwin"."Switch to Screen to the Left" = "none,,切换到左侧屏幕";
      "kwin"."Switch to Screen to the Right" = "none,,切换到右侧屏幕";
      "kwin"."Toggle Night Color" = [ ];
      "kwin"."Toggle Window Raise/Lower" = "none,,提升/降低窗口";
      "kwin"."Walk Through Windows" = "Alt+Tab";
      "kwin"."Walk Through Windows (Reverse)" = "Alt+Shift+Tab";
      "kwin"."Walk Through Windows Alternative" = "none,,遍历窗口交替";
      "kwin"."Walk Through Windows Alternative (Reverse)" = "none,,遍历窗口交替 (反向)";
      "kwin"."Walk Through Windows of Current Application" = "Alt+`";
      "kwin"."Walk Through Windows of Current Application (Reverse)" = "Alt+~";
      "kwin"."Walk Through Windows of Current Application Alternative" =
        "none,,遍历当前应用程序窗口交替";
      "kwin"."Walk Through Windows of Current Application Alternative (Reverse)" =
        "none,,遍历当前应用程序窗口交替 (反向)";
      "kwin"."Window Above Other Windows" = "none,,窗口置顶";
      "kwin"."Window Below Other Windows" = "none,,窗口置底";
      "kwin"."Window Close" = "Alt+F4";
      "kwin"."Window Fullscreen" = "none,,全屏显示窗口";
      "kwin"."Window Grow Horizontal" = "none,,水平扩展窗口";
      "kwin"."Window Grow Vertical" = "none,,垂直扩展窗口";
      "kwin"."Window Lower" = "none,,降低窗口";
      "kwin"."Window Maximize" = "Meta+PgUp";
      "kwin"."Window Maximize Horizontal" = "none,,水平最大化窗口";
      "kwin"."Window Maximize Vertical" = "none,,垂直最大化窗口";
      "kwin"."Window Minimize" = "Meta+PgDown";
      "kwin"."Window Move" = "none,,移动窗口";
      "kwin"."Window Move Center" = "none,,移动窗口到中央";
      "kwin"."Window No Border" = "none,,显示/隐藏窗口标题栏和框架";
      "kwin"."Window On All Desktops" = "none,,在所有桌面上显示窗口";
      "kwin"."Window One Desktop Down" = "Meta+Ctrl+Shift+Down";
      "kwin"."Window One Desktop Up" = "Meta+Ctrl+Shift+Up";
      "kwin"."Window One Desktop to the Left" = "Meta+Ctrl+Shift+Left";
      "kwin"."Window One Desktop to the Right" = "Meta+Ctrl+Shift+Right";
      "kwin"."Window One Screen Down" = "none,,移动窗口到下方屏幕";
      "kwin"."Window One Screen Up" = "none,,移动窗口到上方屏幕";
      "kwin"."Window One Screen to the Left" = "none,,移动窗口到左侧屏幕";
      "kwin"."Window One Screen to the Right" = "none,,移动窗口到右侧屏幕";
      "kwin"."Window Operations Menu" = "Alt+F3";
      "kwin"."Window Pack Down" = "none,,下移窗口";
      "kwin"."Window Pack Left" = "none,,左移窗口";
      "kwin"."Window Pack Right" = "none,,右移窗口";
      "kwin"."Window Pack Up" = "none,,上移窗口";
      "kwin"."Window Quick Tile Bottom" = "Meta+Down";
      "kwin"."Window Quick Tile Bottom Left" = "none,,快速铺放窗口到左下方";
      "kwin"."Window Quick Tile Bottom Right" = "none,,快速铺放窗口到右下方";
      "kwin"."Window Quick Tile Left" = "Meta+Left";
      "kwin"."Window Quick Tile Right" = "Meta+Right";
      "kwin"."Window Quick Tile Top" = "Meta+Up";
      "kwin"."Window Quick Tile Top Left" = "none,,快速铺放窗口到左上方";
      "kwin"."Window Quick Tile Top Right" = "none,,快速铺放窗口到右上方";
      "kwin"."Window Raise" = "none,,提升窗口";
      "kwin"."Window Resize" = "none,,调整窗口大小";
      "kwin"."Window Shade" = "none,,折叠窗口";
      "kwin"."Window Shrink Horizontal" = "none,,水平缩小窗口";
      "kwin"."Window Shrink Vertical" = "none,,垂直缩小窗口";
      "kwin"."Window to Desktop 1" = "none,,窗口移动到桌面 1";
      "kwin"."Window to Desktop 10" = "none,,窗口移动到桌面 10";
      "kwin"."Window to Desktop 11" = "none,,窗口移动到桌面 11";
      "kwin"."Window to Desktop 12" = "none,,窗口移动到桌面 12";
      "kwin"."Window to Desktop 13" = "none,,窗口移动到桌面 13";
      "kwin"."Window to Desktop 14" = "none,,窗口移动到桌面 14";
      "kwin"."Window to Desktop 15" = "none,,窗口移动到桌面 15";
      "kwin"."Window to Desktop 16" = "none,,窗口移动到桌面 16";
      "kwin"."Window to Desktop 17" = "none,,窗口移动到桌面 17";
      "kwin"."Window to Desktop 18" = "none,,窗口移动到桌面 18";
      "kwin"."Window to Desktop 19" = "none,,窗口移动到桌面 19";
      "kwin"."Window to Desktop 2" = "none,,窗口移动到桌面 2";
      "kwin"."Window to Desktop 20" = "none,,窗口移动到桌面 20";
      "kwin"."Window to Desktop 3" = "none,,窗口移动到桌面 3";
      "kwin"."Window to Desktop 4" = "none,,窗口移动到桌面 4";
      "kwin"."Window to Desktop 5" = "none,,窗口移动到桌面 5";
      "kwin"."Window to Desktop 6" = "none,,窗口移动到桌面 6";
      "kwin"."Window to Desktop 7" = "none,,窗口移动到桌面 7";
      "kwin"."Window to Desktop 8" = "none,,窗口移动到桌面 8";
      "kwin"."Window to Desktop 9" = "none,,窗口移动到桌面 9";
      "kwin"."Window to Next Desktop" = "none,,窗口移动到下一桌面";
      "kwin"."Window to Next Screen" = "Meta+Shift+Right";
      "kwin"."Window to Previous Desktop" = "none,,窗口移动到上一桌面";
      "kwin"."Window to Previous Screen" = "Meta+Shift+Left";
      "kwin"."Window to Screen 0" = "none,,移动窗口到屏幕 0";
      "kwin"."Window to Screen 1" = "none,,移动窗口到屏幕 1";
      "kwin"."Window to Screen 2" = "none,,移动窗口到屏幕 2";
      "kwin"."Window to Screen 3" = "none,,移动窗口到屏幕 3";
      "kwin"."Window to Screen 4" = "none,,移动窗口到屏幕 4";
      "kwin"."Window to Screen 5" = "none,,移动窗口到屏幕 5";
      "kwin"."Window to Screen 6" = "none,,移动窗口到屏幕 6";
      "kwin"."Window to Screen 7" = "none,,移动窗口到屏幕 7";
      "kwin"."view_actual_size" = "Meta+0";
      "kwin"."view_zoom_in" = [ "Meta++" "Meta+=,Meta++" "Meta+=,放大(I)" ];
      "kwin"."view_zoom_out" = "Meta+-";
      "mediacontrol"."mediavolumedown" = "none,,媒体音量降低";
      "mediacontrol"."mediavolumeup" = "none,,媒体音量提高";
      "mediacontrol"."nextmedia" = "Media Next";
      "mediacontrol"."pausemedia" = "Media Pause";
      "mediacontrol"."playmedia" = "none,,播放媒体";
      "mediacontrol"."playpausemedia" = "Media Play";
      "mediacontrol"."previousmedia" = "Media Previous";
      "mediacontrol"."stopmedia" = "Media Stop";
      "org_kde_powerdevil"."Decrease Keyboard Brightness" =
        "Keyboard Brightness Down";
      "org_kde_powerdevil"."Decrease Screen Brightness" =
        "Monitor Brightness Down";
      "org_kde_powerdevil"."Decrease Screen Brightness Small" =
        "Shift+Monitor Brightness Down";
      "org_kde_powerdevil"."Hibernate" = "Hibernate";
      "org_kde_powerdevil"."Increase Keyboard Brightness" =
        "Keyboard Brightness Up";
      "org_kde_powerdevil"."Increase Screen Brightness" =
        "Monitor Brightness Up";
      "org_kde_powerdevil"."Increase Screen Brightness Small" =
        "Shift+Monitor Brightness Up";
      "org_kde_powerdevil"."PowerDown" = "Power Down";
      "org_kde_powerdevil"."PowerOff" = "Power Off";
      "org_kde_powerdevil"."Sleep" = "Sleep";
      "org_kde_powerdevil"."Toggle Keyboard Backlight" =
        "Keyboard Light On/Off";
      "org_kde_powerdevil"."Turn Off Screen" = [ ];
      "org_kde_powerdevil"."powerProfile" =
        [ "Battery" "Meta+B,Battery" "Meta+B,切换电源管理方案" ];
      "plasmashell"."activate application launcher" =
        [ "Meta,Meta" "Alt+F1,激活应用程序启动器" ];
      "plasmashell"."activate task manager entry 1" = "Meta+1";
      "plasmashell"."activate task manager entry 10" =
        "none,Meta+0,激活任务管理器条目 10";
      "plasmashell"."activate task manager entry 2" = "Meta+2";
      "plasmashell"."activate task manager entry 3" = "Meta+3";
      "plasmashell"."activate task manager entry 4" = "Meta+4";
      "plasmashell"."activate task manager entry 5" = "Meta+5";
      "plasmashell"."activate task manager entry 6" = "Meta+6";
      "plasmashell"."activate task manager entry 7" = "Meta+7";
      "plasmashell"."activate task manager entry 8" = "Meta+8";
      "plasmashell"."activate task manager entry 9" = "Meta+9";
      "plasmashell"."clear-history" = "none,,清除剪贴板历史(L)";
      "plasmashell"."clipboard_action" = "Meta+Ctrl+X";
      "plasmashell"."cycle-panels" = "Meta+Alt+P";
      "plasmashell"."cycleNextAction" = "none,,下一条历史记录";
      "plasmashell"."cyclePrevAction" = "none,,上一条历史记录";
      "plasmashell"."manage activities" = "Meta+Q";
      "plasmashell"."next activity" = "Meta+A,none,遍历活动";
      "plasmashell"."previous activity" = "Meta+Shift+A,none,遍历活动 (反向)";
      "plasmashell"."repeat_action" = "none,Meta+Ctrl+R,在当前剪贴板上手动执行操作";
      "plasmashell"."show dashboard" = "Ctrl+F12";
      "plasmashell"."show-barcode" = "none,,显示条形码(S)…";
      "plasmashell"."show-on-mouse-pos" = "Meta+V";
      "plasmashell"."stop current activity" = "Meta+S";
      "plasmashell"."switch to next activity" = "none,,切换到下一个活动";
      "plasmashell"."switch to previous activity" = "none,,切换到上一个活动";
      "plasmashell"."toggle do not disturb" = "none,,切换勿扰模式";
      "yakuake"."toggle-window-state" = "Alt+E,F12,展开/折叠 Yakuake 窗口";
    };
    configFile = {
      "baloofilerc"."General"."dbVersion" = 2;
      "baloofilerc"."General"."exclude filters" =
        "*~,*.part,*.o,*.la,*.lo,*.loT,*.moc,moc_*.cpp,qrc_*.cpp,ui_*.h,cmake_install.cmake,CMakeCache.txt,CTestTestfile.cmake,libtool,config.status,confdefs.h,autom4te,conftest,confstat,Makefile.am,*.gcode,.ninja_deps,.ninja_log,build.ninja,*.csproj,*.m4,*.rej,*.gmo,*.pc,*.omf,*.aux,*.tmp,*.po,*.vm*,*.nvram,*.rcore,*.swp,*.swap,lzo,litmain.sh,*.orig,.histfile.*,.xsession-errors*,*.map,*.so,*.a,*.db,*.qrc,*.ini,*.init,*.img,*.vdi,*.vbox*,vbox.log,*.qcow2,*.vmdk,*.vhd,*.vhdx,*.sql,*.sql.gz,*.ytdl,*.tfstate*,*.class,*.pyc,*.pyo,*.elc,*.qmlc,*.jsc,*.fastq,*.fq,*.gb,*.fasta,*.fna,*.gbff,*.faa,po,CVS,.svn,.git,_darcs,.bzr,.hg,CMakeFiles,CMakeTmp,CMakeTmpQmake,.moc,.obj,.pch,.uic,.npm,.yarn,.yarn-cache,__pycache__,node_modules,node_packages,nbproject,.terraform,.venv,venv,core-dumps,lost+found";
      "baloofilerc"."General"."exclude filters version" = 9;
      "dolphinrc"."General"."ViewPropsTimestamp" = "2024,7,27,2,20,43.802";
      "dolphinrc"."KFileDialog Settings"."Places Icons Auto-resize" = false;
      "dolphinrc"."KFileDialog Settings"."Places Icons Static Size" = 22;
      "kactivitymanagerdrc"."activities"."646008db-b807-4cfb-a6f1-f8aa35c92990" =
        "默认";
      "kactivitymanagerdrc"."main"."currentActivity" =
        "646008db-b807-4cfb-a6f1-f8aa35c92990";
      "kcminputrc"."Keyboard"."NumLock" = 0;
      "kcminputrc"."Libinput/1267/12608/ELAN0001:00 04F3:3140 Touchpad"."Enabled" =
        false;
      "kded5rc"."Module-device_automounter"."autoload" = false;
      "kdeglobals"."DirSelect Dialog"."DirSelectDialog Size" = "769,585";
      "kdeglobals"."KFileDialog Settings"."Allow Expansion" = false;
      "kdeglobals"."KFileDialog Settings"."Automatically select filename extension" =
        true;
      "kdeglobals"."KFileDialog Settings"."Breadcrumb Navigation" = true;
      "kdeglobals"."KFileDialog Settings"."Decoration position" = 2;
      "kdeglobals"."KFileDialog Settings"."LocationCombo Completionmode" = 5;
      "kdeglobals"."KFileDialog Settings"."PathCombo Completionmode" = 5;
      "kdeglobals"."KFileDialog Settings"."Show Bookmarks" = false;
      "kdeglobals"."KFileDialog Settings"."Show Full Path" = false;
      "kdeglobals"."KFileDialog Settings"."Show Inline Previews" = true;
      "kdeglobals"."KFileDialog Settings"."Show Speedbar" = true;
      "kdeglobals"."KFileDialog Settings"."Show hidden files" = false;
      "kdeglobals"."KFileDialog Settings"."Sort by" = "Name";
      "kdeglobals"."KFileDialog Settings"."Sort directories first" = true;
      "kdeglobals"."KFileDialog Settings"."Sort hidden files last" = false;
      "kdeglobals"."KFileDialog Settings"."Sort reversed" = false;
      "kdeglobals"."KFileDialog Settings"."Speedbar Width" = 89;
      "kdeglobals"."KFileDialog Settings"."View Style" = "DetailTree";
      "kdeglobals"."KShortcutsDialog Settings"."Dialog Size" = "600,480";
      "kdeglobals"."WM"."activeBackground" = "49,54,59";
      "kdeglobals"."WM"."activeBlend" = "252,252,252";
      "kdeglobals"."WM"."activeForeground" = "252,252,252";
      "kdeglobals"."WM"."inactiveBackground" = "42,46,50";
      "kdeglobals"."WM"."inactiveBlend" = "161,169,177";
      "kdeglobals"."WM"."inactiveForeground" = "161,169,177";
      "kwalletrc"."Wallet"."First Use" = false;
      "kwinrc"."Desktops"."Id_1" = "b471d585-c481-4909-a20b-74a426e3a967";
      "kwinrc"."Desktops"."Number" = 1;
      "kwinrc"."Desktops"."Rows" = 1;
      "kwinrc"."NightColor"."Active" = true;
      "kwinrc"."NightColor"."Mode" = "Constant";
      "kwinrc"."Tiling"."padding" = 4;
      "kwinrc"."Tiling/706f6a44-25e8-5167-afff-1d06ee793c0f"."tiles" = ''
        {"layoutDirection":"horizontal","tiles":[{"width":0.25},{"width":0.5},{"width":0.25}]}'';
      "kwinrc"."Tiling/864086e2-5565-5170-bd49-b531bda08fb4"."tiles" = ''
        {"layoutDirection":"horizontal","tiles":[{"width":0.25},{"width":0.5},{"width":0.25}]}'';
      "kwinrc"."Wayland"."InputMethod[$e]" =
        "/run/current-system/sw/share/applications/fcitx5-wayland-launcher.desktop";
      "kwinrc"."Xwayland"."Scale" = 1.25;
      "kxkbrc"."Layout"."DisplayNames" = "";
      "kxkbrc"."Layout"."LayoutList" = "us";
      "kxkbrc"."Layout"."Use" = true;
      "kxkbrc"."Layout"."VariantList" = "";
      "plasma-localerc"."Formats"."LANG" = "zh_CN.UTF-8";
      "plasmanotifyrc"."Applications/firefox"."Seen" = true;
    };
  };
}
