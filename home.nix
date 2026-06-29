{ pkgs, username, homeDir, ... }:

{
  imports = [ ./git.nix ./yazi.nix ];

  home.username = username;
  home.homeDirectory = homeDir;
  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  # --- Packages ---
  home.packages = with pkgs; [
    bat
    btop
    delta
    fd
    fish
    fzf
    jq
    jujutsu
    neovim
    ripgrep
    tmux
    zellij

    # Language runtimes (needed by LSP servers)
    go
    jdk21_headless
    nodejs
    python3
    rustup

    # LSP servers (managed by nix instead of mason)
    bash-language-server
    dockerfile-language-server
    gopls
    lua-language-server
    marksman
    typescript-language-server
    pyright

    starpls
    vscode-langservers-extracted # html/css/json
    yaml-language-server

    # Fish plugins (sourced via conf.d/nix-plugins.fish)
    fishPlugins.z
    fishPlugins.pure
    fishPlugins.fzf-fish
  ];

  # --- XDG config files (~/.config/) ---
  xdg.configFile.".".source = ./dot-config;
  xdg.configFile.".".recursive = true;

  # --- Tmux ---
  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile ./tmux-config/tmux.conf
      + ''

        bind "=" run-shell -b "${pkgs.tmuxPlugins.tmux-fzf}/share/tmux-plugins/tmux-fzf/scripts/clipboard.sh"
      '';
    plugins = with pkgs.tmuxPlugins; [
      sensible
      tmux-fzf
      {
        plugin = pkgs.tmuxPlugins.mkTmuxPlugin {
          pluginName = "airline";
          version = "local";
          src = ./tmux-config/airline;
        };
      }
    ];
  };

  # --- Home directory dotfiles ---
  home.file = {
    ".inputrc".source = ./shell-config/inputrc;
  };
}
