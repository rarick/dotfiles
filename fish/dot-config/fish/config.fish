set -gx EDITOR nvim
set -gx VISUAL nvim

if status is-interactive
    # Commands to run in interactive sessions can go here

    fish_config theme choose "Dracula Official"

    set fish_key_bindings fish_user_key_bindings

    fzf_configure_bindings \
        --directory=\ct\
        --git_log=\cg \
        --git_status=\cs \
        --history=\cr \
        --processes=\cx \
        --variables=\cv
end

# Machine-specific config
test -f ~/.config/fish/conf.d/local.fish; and source ~/.config/fish/conf.d/local.fish
