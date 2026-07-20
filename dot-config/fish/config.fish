set -gx EDITOR nvim
set -gx VISUAL nvim

# System paths
fish_add_path --append /usr/local/bin

# Nix
fish_add_path --prepend /nix/var/nix/profiles/default/bin ~/.nix-profile/bin

# Disable greeting
set fish_greeting

if status is-interactive
    fish_config theme choose dracula

    set fish_key_bindings fish_user_key_bindings

    fzf_configure_bindings \
        --directory=\ct\
        --git_log=\cg \
        --git_status=\cs \
        --history=\cr \
        --processes=\cx \
        --variables=\cv
end
