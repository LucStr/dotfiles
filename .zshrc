# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Created by newuser for 5.8
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Bind Keys
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'
alias ls='exa'
alias cat='bat'
alias copy='xclip -sel clip'
alias lvim='~/.local/bin/lvim'
alias ssh='TERM=xterm-256color ssh'
alias config='/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME'

# Persist History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

export EDITOR='nvim'
export MYVIMRC='.config/nvim/init.vim'
export SHELL='/bin/zsh'
export AWS_PROFILE='luca_cli'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
autoload -Uz compinit && compinit

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/etc/profile.d/conda.sh" ]; then
        . "/usr/etc/profile.d/conda.sh"
    else
        export PATH="/usr/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#.bash_profile
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
