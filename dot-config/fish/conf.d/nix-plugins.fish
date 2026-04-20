# Source fish plugins installed via nix home.packages
set -l nix_profile ~/.nix-profile/share/fish
if test -d $nix_profile
    set fish_function_path $nix_profile/vendor_functions.d $fish_function_path
    set fish_complete_path $nix_profile/vendor_completions.d $fish_complete_path
    for f in $nix_profile/vendor_conf.d/*.fish
        source $f
    end
end
