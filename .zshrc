if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=$HOME/.oh-my-zsh

DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy/mm/dd"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias lc='colorls -l'

if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='mvim'
fi

export LANG=en_US.UTF-8

source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme
source ~/catppuccin_mocha-zsh-syntax-highlighting.zsh
ZSH_THEME="powerlevel10k/powerlevel10k"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias icat="kitty +kitten icat"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/mindaugasstagys/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/mindaugasstagys/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/mindaugasstagys/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/mindaugasstagys/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

