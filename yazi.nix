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
    '';

    keymap = {
      mgr.prepend_keymap = [
        { on = [ "m" ]; run = "plugin bookmarks save"; desc = "Save bookmark"; }
        { on = [ "'" ]; run = "plugin bookmarks jump"; desc = "Jump to bookmark"; }
        { on = [ "b" "d" ]; run = "plugin bookmarks delete"; desc = "Delete bookmark"; }
        { on = [ "b" "D" ]; run = "plugin bookmarks delete_all"; desc = "Delete all bookmarks"; }
      ];
    };
  };
}
