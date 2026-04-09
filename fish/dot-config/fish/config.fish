set -gx EDITOR nvim
set -gx VISUAL nvim

# Keep fisher plugins separate from our config
set -gx fisher_path ~/.local/share/fisher
set fish_function_path $fish_function_path[1] $fisher_path/functions $fish_function_path[2..]
set fish_complete_path $fish_complete_path[1] $fisher_path/completions $fish_complete_path[2..]
if test -d $fisher_path/conf.d
    for f in $fisher_path/conf.d/*.fish
        source $f
    end
end

if status is-interactive
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
