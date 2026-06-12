source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch (YES!)
function fish_greeting
    # smth smth
end

# Enable transient prompt (idk if this actually does anything here)
set -g fish_transient_prompt 1

# exported variables
set -gx EDITOR nvim # Set NeoVim as default editor

# set alias config for my dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
