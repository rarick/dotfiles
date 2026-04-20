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
    fzf
    jq
    neovim
    ripgrep
    starship
    tmux

    # LSP servers (managed by nix instead of mason)
    bash-language-server
    dockerfile-language-server
    gopls
    lua-language-server
    marksman
    typescript-language-server
    pyright
    rust-analyzer
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

  # --- Home directory dotfiles ---
  home.file = {
    ".inputrc".source = ./shell-config/inputrc;
    ".tmux.conf".source = ./tmux-config/tmux.conf;
  };
}
