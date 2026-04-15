{ ... }:

{
  programs.git = {
    enable = true;
    settings = {
      alias = {
        dag = "log --graph --format='format:%C(yellow)%h%C(reset) %C(blue)%an <%ae>%C(reset) %C(magenta)%cr%C(reset)%C(auto)%d%C(reset)%n%s' --date-order";
        undo = "reset HEAD~1 --mixed";
        amend = "commit --amend --no-edit";
        wip = "commit -am 'wip'";
        branches = "branch --sort=-committerdate --format='%(committerdate:relative) %(refname:short)'";
      };
      core.pager = "delta";
      interactive.diffFilter = "delta --syntax-theme Dracula --color-only";
      delta = {
        navigate = true;
        side-by-side = true;
        line-numbers = true;
      };
      push.default = "simple";
      color.ui = "auto";
      diff.algorithm = "histogram";
      init.defaultBranch = "main";
      merge.tool = "nvimdiff";
      merge.conflictstyle = "zdiff3";
      mergetool.prompt = false;
      mergetool.nvimdiff.cmd = "nvim -d $LOCAL $REMOTE $MERGED";
      include.path = "~/.gitconfig-local";
    };
    ignores = [
      ".attach_pid*"
      "*.swp" "*.swo" "*.vimbackup" "*.bak" "*.backup" "*.un~"
      ".DS_Store" "*~"
      "node_modules/" "logs" "*.log" "vendor/"
      "*.com" "*.class" "*.dll" "*.exe" "*.o" "*.so"
      "*.7z" "*.dmg" "*.gz" "*.iso" "*.jar" "*.rar" "*.tar" "*.zip"
      ".idea/" ".vscode/"
      "*.lock" "*.pyc" "__pycache__/" "*.factorypath"
      "pyrightconfig.json" ".classpath" ".project" ".settings/" "*.out"
      "/generated*/" "build/"
      "target/" "Cargo.lock" "rust-toolchain.toml" "coverage/"
      "*.iml" "local.properties" "gen/" "ant.properties" "*.apk" "*.ap_" "*.dex"
      "xcuserdata" ".ruby-env" "._*"
      ".factorypath" ".apt_generated/" "eclipse*/" ".externalToolBuilders/"
      "tags"
    ];
  };
}
