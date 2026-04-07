# abbrs (short hand expands, shows full command in history)
abbr -a c  clear
abbr -a l  'clear; ls -lh'
abbr -a ll 'clear; ls -alh'
abbr -a v  nvim
abbr -a vim nvim
abbr -a .. 'cd ..'
abbr -a e  exit
abbr -a gb 'clear; git branch'
abbr -a gs 'clear; git status'
abbr -a ga 'git add .; clear; git status'
abbr -a gr 'git reset'
abbr -a dh 'git diff HEAD'
abbr -a ds 'clear; docker ps -a'
abbr -a xc clipcopy
abbr -a xv clippaste
abbr -a sbc 'source ~/.config/fish/config.fish'
abbr -a lzg lazygit

function cd --wraps=cd
    if test (count $argv) -eq 0
        builtin cd
    else
        builtin cd $argv
    end
    clear; ls -lh
end

function cdg
    command git rev-parse --show-toplevel 2>/dev/null | read -l root; and cd $root
end

function gc
    set -l msg (string join " " -- $argv)
    git commit -m "$msg"
end

function r
    ranger --choosedir=$HOME/.rangerdir
    if test -f $HOME/.rangerdir
        set -l lastdir (cat $HOME/.rangerdir)
        if test -d "$lastdir"
            cd "$lastdir"
        end
    end
end

