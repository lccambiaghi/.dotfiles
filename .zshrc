# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/Users/luca/.oh-my-zsh"
ZSH_THEME=powerlevel10k/powerlevel10k
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

plugins=(
git
zsh-syntax-highlighting
zsh-autosuggestions
common-aliases
)

source $ZSH/oh-my-zsh.sh

# https://medium.com/toutsbrasil/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias em='emacsclient -n '
# alias rstudio='open -a RStudio .'
# alias pycharm='open -a PyCharm .'
# alias wcast='cd ~/git/wondercast'
# alias empt='cd ~/git/emptiesforecast'
alias kp='kubectl get pods'
alias wkp='watch -n 1 kubectl get pods'
alias kpr='kubectl get pods --field-selector status.phase=Running'
alias wkpr='watch -n 1 kubectl get pods --field-selector status.phase=Running'
alias kl='kubectl logs'
alias jqf='grep -E "^{"|jq'
alias jqm='grep -E "^{"|jq .message'
alias kga='kubectl get all'
alias kdl='kubectl delete '
alias kds='kubectl describe '

if [ -n "$(which pyenv)" ]; then
  eval "$(pyenv init -)"
  # eval "$(pyenv virtualenv-init -)"
  # export PYENV_VIRTUALENV_DISABLE_PROMPT=1
fi

if [ -n "$(which direnv)" ]; then
  eval "$(direnv hook $(basename $SHELL))"
  # export DIRENV_WARN_TIMEOUT=100s
fi

# restore custom path set up in ~/.zshenv
export PATH=$CUSTOM_PATH

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
