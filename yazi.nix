{ pkgs, ... }:

let
  yaziPlugins = builtins.fetchGit {
    url = "https://github.com/yazi-rs/plugins.git";
    ref = "main";
    shallow = true;
  };
  yaziFlavors = builtins.fetchGit {
    url = "https://github.com/yazi-rs/flavors.git";
    ref = "main";
    shallow = true;
  };
in {
  programs.yazi = {
    enable = true;
    enableFishIntegration = false;

    plugins = {
      bookmarks = builtins.fetchGit {
        url = "https://github.com/dedukun/bookmarks.yazi.git";
        ref = "main";
        shallow = true;
      };
      relative-motions = builtins.fetchGit {
        url = "https://github.com/dedukun/relative-motions.yazi.git";
        ref = "main";
        shallow = true;
      };
      full-border = "${yaziPlugins}/full-border.yazi";
      git = "${yaziPlugins}/git.yazi";
    };

    flavors = {
      dracula = "${yaziFlavors}/dracula.yazi";
    };

    theme = {
      flavor = { dark = "dracula"; };
    };

    initLua = ''
      require("full-border"):setup()
      require("git"):setup()
      require("bookmarks"):setup({ persist = "all" })
      require("relative-motions"):setup({ show_motion = true })
    '';

    keymap = {
      mgr.prepend_keymap = [
        { on = [ "m" ]; run = "plugin bookmarks save"; desc = "Save bookmark"; }
        { on = [ "'" ]; run = "plugin bookmarks jump"; desc = "Jump to bookmark"; }
        { on = [ "b" "d" ]; run = "plugin bookmarks delete"; desc = "Delete bookmark"; }
        { on = [ "b" "D" ]; run = "plugin bookmarks delete_all"; desc = "Delete all bookmarks"; }
        { on = [ "1" ]; run = "plugin relative-motions 1"; desc = "Move in relative steps"; }
        { on = [ "2" ]; run = "plugin relative-motions 2"; desc = "Move in relative steps"; }
        { on = [ "3" ]; run = "plugin relative-motions 3"; desc = "Move in relative steps"; }
        { on = [ "4" ]; run = "plugin relative-motions 4"; desc = "Move in relative steps"; }
        { on = [ "5" ]; run = "plugin relative-motions 5"; desc = "Move in relative steps"; }
        { on = [ "6" ]; run = "plugin relative-motions 6"; desc = "Move in relative steps"; }
        { on = [ "7" ]; run = "plugin relative-motions 7"; desc = "Move in relative steps"; }
        { on = [ "8" ]; run = "plugin relative-motions 8"; desc = "Move in relative steps"; }
        { on = [ "9" ]; run = "plugin relative-motions 9"; desc = "Move in relative steps"; }
      ];
    };
  };
}
