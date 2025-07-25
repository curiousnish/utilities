
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# To activate the self-created ml virtual env from conda
conda activate ml

# Used for Ruby and Jekyll
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
chruby ruby-3.1.3

## Poweruser Shell Scripts 

# Initializing oh-my-posh and setting the night-owl theme 
eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/smoothie.omp.json)"

# Add scripts folder to the PATH
export PATH="$PATH:$HOME/scripts"

## Conda activate shortcut
alias ca='conda activate'
alias cau='conda activate utils'
alias caml='conda activate ml'

## Open Github folder
alias dev='cd /Users/nishith/Code'

## Obsidian
# cd to the main vault
alias oo='cd /Users/nishith/library/Mobile\ Documents/iCloud~md~obsidian/Documents/Nish'
# open a file in obsidian
alias opn='open -a Obsidian'

## Shira downloader
alias shirad='cd /Users/nishith/utils/shira'
alias shiradl='python -m shiradl'

# Nav
alias pwdc="pwd | pbcopy"
alias cl="clear"
alias z="cd"
alias lr="ls -lrt"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# Add flutter SDK to PATH
export PATH="/Users/nishith/development/flutter/bin:$PATH"

# fzf config
# Setup fzf
# ---------
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings

# ------------
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"

# Custom fzf options
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# binding for directory search
bindkey "þ" fzf-cd-widget

# ngrok settinga
# if command -v ngrok &>/dev/null; then
#     eval "$(ngrok completion)"
# fi

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion